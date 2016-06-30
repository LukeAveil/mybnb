require 'date'

class MakersBnB < Sinatra::Base

  get '/requests' do
    @requests_made = Request.all(user: @user)
    @requests_received = Request.owner(@user)
    erb :'requests/index'
  end

  post '/requests' do
    @space = Space.first(id: params[:space_id])
    if Request.date_valid(@space.available_dates, Date.parse(params[:requested_date]))
      request = Request.create(user: @user,
                               space: @space,
                               confirmed: 0,
                               date: Date.parse(params[:requested_date]))
    end
    redirect '/requests'
  end

  put '/requests/approve/:id' do
    request = Request.first(id: params[:id])
    space = request.space

    if Request.unconfirmed_requests_for?(space)
      space.confirm_booking_on(request.date)
      Request.reject_requests(space: space, date: request.date)
      request.confirm
    end

    redirect '/requests'
  end

  helpers do
    def get_request_status(number)
      messages = {
        0 => 'Not confirmed',
        1 => 'Rejected',
        2 => 'Confirmed'
      }
      messages[number]
    end

    def confirmed?(request)
      request == 1 || 2 ? true : false
    end
  end

end

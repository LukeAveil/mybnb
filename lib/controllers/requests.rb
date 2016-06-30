require 'date'

class MakersBnB < Sinatra::Base

  get '/requests' do
    @requests_made = Request.all(user: User.first(id: session[:user_id]))
    @requests_received = Request.all.select do |request|
      request.space.user.id == session[:user_id]
    end
    erb :'requests/index'
  end

  put '/requests' do
    request = Request.create(user: User.first(id: session[:user_id]),
                          space: Space.first(id: params[:space_id]),
                          confirmed: 0,
                          date: Date.parse(params[:requested_date]))
    redirect '/requests'
  end

  put '/requests/:id' do
    request = Request.first(id: params[:id])
    space = Space.first(id: request.space.id)

    space.available_dates = space.available_dates.select do |av_date|
      av_date.date != request.date
    end
    space.save

    denied_requests = Request.all(space: space)
    denied_requests = denied_requests.all(date: request.date)
    denied_requests.update(confirmed: 1)

    request.update(confirmed: 2)

    redirect '/requests'
  end

  helpers do
    def get_request_status(number)
      messages = {
        '0' => 'Not confirmed',
        '1' => 'Rejected',
        '2' => 'Confirmed'
      }
      messages[number.to_s]
    end
  end

end
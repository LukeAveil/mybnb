class MakersBnB < Sinatra::Base

  post '/charge' do
    request = Request.first(id: params[:request_id])
    request.update(payment_received: true)
    redirect to '/requests'
  end

end

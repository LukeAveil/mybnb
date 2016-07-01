class MakersBnB < Sinatra::Base

  post '/messages' do
    message = Message.create(message: params[:message], user: @user)
    request = Request.first(id: params[:request_id])
    request.messages << message
    request.save
    redirect "/requests/#{ params[:request_id] }"
  end

end

class MakersBnB < Sinatra::Base

  get '/spaces' do
    @user = User.first(id: session[:user_id])
    erb :'spaces/index'
  end

end

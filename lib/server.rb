class MakersBnB < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  before do
    @user = User.first(id: session[:user_id])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

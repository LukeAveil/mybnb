class MakersBnB < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'
  # start the server if ruby file executed directly
  run! if app_file == $0
end

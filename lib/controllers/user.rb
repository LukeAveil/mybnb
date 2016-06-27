class MakersBnB < Sinatra::Base

  get '/' do
    erb :'users/signup'
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    
    "Book a Space"
  end

end

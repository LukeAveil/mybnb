class MakersBnB < Sinatra::Base

  get '/' do
    erb :'users/signup'
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])

    if user.save
      session[:user_id] = user.id
      "Book a Space"
    else
      flash[:errors] = user.errors.full_messages
      redirect '/'
    end
  end

  get '/sessions/new' do
    erb :'users/login'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = User.first(email: params[:email]).id
      redirect '/spaces'
    else
      flash[:errors] = ["Invalid email or password"]
      redirect '/sessions/new'
    end
  end

end

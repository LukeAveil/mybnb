class MakersBnB < Sinatra::Base

  get '/spaces' do
    @user = User.first(id: session[:user_id])
    @spaces = Space.all
    erb :'spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    space = Space.create(name: params[:name],
                 price: params[:price],
                 description: params[:description],
                 user: User.first(id: session[:user_id]))
    date = AvailableDate.create(date: Date.parse(params[:date]))
    space.dates << date

    redirect '/spaces'
  end

end

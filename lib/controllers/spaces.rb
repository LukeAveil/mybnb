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
    Space.create(name: params[:name],
                 price: params[:price],
                 description: params[:description],
                 user: User.first(id: session[:user_id]))
    redirect '/spaces'
  end

  get '/spaces/:id' do
    calendar = Calendar.new(2016, 9, ["2016-09-12"])
    @date_list = calendar.list_dates
    erb :'spaces/space'
  end

end

class MakersBnB < Sinatra::Base

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  get '/listSpace' do
    erb :'spaces/new'
  end

  put '/spaces' do
    space = Space.new(name: params[:name],
                      price: params[:price],
                      description: params[:description],
                      user: User.first(id: session[:user_id]))
    date = AvailableDate.create(date: Date.parse(params[:date]))
    space.available_dates << date
    space.save
    redirect '/spaces'
  end

  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    @available_dates = @space.available_dates.map { |d| d.date }
    @date_list = Calendar.days_for_next_year
    erb :'spaces/view'
  end

  put '/spaces/:id' do
    @space = Space.first(id: params[:id])
  if @space.user_id == @user.id
    date = AvailableDate.create(date: Date.parse(params[:date]))
    @space.available_dates << date
    @space.save
  end
    redirect "/spaces/#{ params[:id] }"
  end

end

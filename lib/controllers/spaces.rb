class MakersBnB < Sinatra::Base

  helpers do
    def setSpace()
      @id = request.path_info.split('/').last
      @space = Space.first(id: @id)
    end
  end

  get '/spaces' do
    @user = User.first(id: session[:user_id])
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
    setSpace
    @available_dates = @space.available_dates.map { |d| d.date }

    calendar = Calendar.new(@available_dates.last.year, @available_dates.last.month)
    @date_list = calendar.list_dates
    erb :'spaces/view'
  end

  put '/spaces/:id' do
    setSpace
    date = AvailableDate.create(date: Date.parse(params[:date]))
    @space.available_dates << date
    @space.save
    redirect '/spaces'
  end

end

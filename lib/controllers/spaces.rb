class MakersBnB < Sinatra::Base

  get '/spaces' do
    if params[:from]
      @spaces = Space.all.select do |space|
        space.in_range?(Date.parse(params[:from]), Date.parse(params[:to]))
      end
    else
      @spaces = Space.all
    end

    erb :'spaces/index'
  end

  get '/my_spaces' do
    @spaces = Space.all(user: @user)
    erb :'spaces/myspaces'
  end


  get '/list_space' do
    @min_date = Date.today
    @max_date = Date.today + 365
    erb :'spaces/new'
  end

  post '/spaces' do
    space = Space.new(name: params[:name],
                      price: params[:price],
                      description: params[:description],
                      photo: params[:photo][:filename],
                      user: @user)
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    space.available_dates = AvailableDate.all(date: start_date..end_date)
    space.save
    Space.upload_photo(params[:photo][:filename],
                       params[:photo][:tempfile])
    redirect '/spaces'
  end

  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    @available_dates = Calendar.extract_dates(@space.available_dates)
    @date_list = Calendar.days_for_next_year
    @disabled_dates = Calendar.invert_dates(@available_dates)
    erb :'spaces/view'
  end

  put '/spaces/:id' do
    @space = Space.first(id: params[:id])
    if @space.user_id == @user.id
      if Request.date_not_already_booked(@space,params[:date])
        date = AvailableDate.create(date: Date.parse(params[:date]))
        @space.available_dates << date
        @space.save
      else
        flash[:errors] = ["Date already booked"]
      end
    end
    redirect "/spaces/#{ params[:id] }"
  end

  helpers do
    def parse_for_js(array)
      array.map { |d| "\"#{d}\"" }.join(", ")
    end
  end

end

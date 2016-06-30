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

  get '/listSpace' do
    erb :'spaces/new'
  end

  post '/spaces' do
    space = Space.new(name: params[:name],
                      price: params[:price],
                      description: params[:description],
                      user: @user)
    date = AvailableDate.create(date: Date.parse(params[:date]))
    space.available_dates << date
    space.save
    redirect '/spaces'
  end

  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    @available_dates = @space.available_dates.map { |d| d.date }
    @date_list = Calendar.days_for_next_year
    @disabled_dates = @date_list - @available_dates
    @disabled_dates = @disabled_dates.map { |d| "\"#{d}\"" }
    @available_dates = @available_dates.map { |d| "\"#{d}\"" }
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

end

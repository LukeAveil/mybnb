require 'sinatra/base'

class MakersBnB < Sinatra::Base

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(name: params[:name], price: params[:price], description: params[:description])
    redirect '/spaces'
  end

end

require 'sinatra'
require './lib/player'
require './lib/game'

class RPS < Sinatra::Base
  enable :sessions 
  # keeps state during requests

  configure do
    set :public_folder, 'public'
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    @player_1 = Player.new(params[:player_1_name])
    erb :play
  end

  post '/next' do
    session[:player_1_choice] = params[:attack_type]
    redirect '/next'
  end

  get '/next' do
    @player_1_choice = session[:player_1_choice]
    erb(:next)
  end


  # start the server if ruby file executed directly
  run! if app_file == $0

end

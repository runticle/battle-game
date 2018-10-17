require 'sinatra/base'
require 'sinatra/flash'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  post '/names' do
    $p1 = Player.new(params[:p1])
    $p2 = Player.new(params[:p2])
    redirect('/play')
  end

  get '/play' do
    @p1 = $p1.name
    @p2 = $p2.name
    @p2_health = $p2.health
    erb(:play)
  end

  post '/play/:attack' do
    @p1 = $p1.name
    @p2 = $p2.name
    Game.new.attack($p2)
    flash[:attack] = "You attacked #{@p2}!"
    redirect('/play')
  end
end

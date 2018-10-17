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
    p1 = Player.new(params[:p1])
    p2 = Player.new(params[:p2])
    $game = Game.new(p1, p2)
    redirect('/play')
  end

  get '/play' do
    @p1 = $game.player1.name
    @p2 = $game.player2.name
    @p1_health = $game.player1.health
    @p2_health = $game.player2.health
    erb(:play)
  end

  post '/play/:attack' do
    @p1 = $game.player1.name
    @p2 = $game.player2.name
    $game.attack($game.player2) if params[:attack] == "attack_p2"
    $game.attack($game.player1) if params[:attack] == "attack_p1"
    flash[:attack] = "You attacked them! Yay!"
    redirect('/play')
  end
end

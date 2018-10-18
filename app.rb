require 'sinatra/base'
require 'sinatra/flash'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  before do
    @game = Game.instance
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    p1 = Player.new(params[:p1_name])
    p2 = Player.new(params[:p2_name])
    @game = Game.create(p1, p2)
    redirect('/play')
  end

  get '/play' do
    erb(:play)
  end

  post '/play/punch' do
    @game.punch(@game.receiver)
    redirect('/game-over') if @game.game_over?
    redirect('/play')
  end

  post '/play/kick' do
    @game.kick(@game.receiver)
    redirect('/game-over') if @game.game_over?
    redirect('/play')
  end

  post '/play/heal' do
    @game.heal(@game.receiver)
    redirect('/play')
  end

  get '/game-over' do
    @game
    erb(:game_over)
  end
end

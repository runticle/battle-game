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

  post '/play/:attack' do
    @game.punch(@game.next_receiver)
    flash[:attack] = "#{@game.next_attacker.name} #{params[:attack]}ed #{@game.next_receiver.name}! Yay!"
    redirect('/game-over') if @game.game_over?
    @game.change_receiver
    @game.change_attacker
    redirect('/play')
  end

  get '/game-over' do
    erb(:game_over)
  end
end

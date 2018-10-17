require 'sinatra/base'
require 'sinatra/flash'
require './lib/player'

class Battle < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get "/" do
    erb(:index)
  end

  post "/names" do
    $p1 = Player.new(params[:p1])
    $p2 = Player.new(params[:p2])
    redirect('/play')
  end

  get "/play" do
    @p1 = $p1.name
    @p2 = $p2.name
    erb(:play)
  end

  post "/play/:attack" do
    @p1 = $p1.name
    @p2 = $p2.name
    flash[:attack] = "You attacked #{@p2}!"
    redirect('/play')
  end

end

require 'sinatra/base'
require 'sinatra/flash'


class Battle < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get "/" do
    erb(:index)
  end

  post "/names" do
    session['p1'] = params[:p1]
    session['p2'] = params[:p2]
    redirect('/play')
  end

  get "/play" do
    @p1 = session['p1']
    @p2 = session['p2']
    erb(:play)
  end

  post "/play/:attack" do
    flash[:attack] = "You attacked #{session['p2']}!"
    @p1 = session['p1']
    @p2 = session['p2']
    redirect('/play')
  end

end

require 'sinatra/base'

class App < Sinatra::Base
  set :views, proc { File.join(root, '../views/') }

  get '/' do
    erb :super_hero
  end

  post '/teams' do
    @team = Team.new(params[:team])
    @super_hero = params[:team][:superheros].map do |ind_hero|
      SuperHero.new(ind_hero)
    end
    @superheros = SuperHero.all
    erb :team
  end
end

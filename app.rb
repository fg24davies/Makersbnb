require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require './database_setup'

class Apebnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :method_override, :sessions
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  get '/sign_up' do
  end
end 

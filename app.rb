require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'

class Apebnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :method_override, :sessions
  register Sinatra::Flash
end 

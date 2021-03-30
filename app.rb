require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require './database_setup'
require './lib/user'
require './lib/listing'
require './lib/user'

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
    erb(:sign_up)
  end

  post '/user/new' do
    User.add(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/user/welcome'
  end

  get '/user/welcome' do
    erb(:welcome)

  get '/listings' do
    erb(:listings)

  end

  post '/sessions' do
    if User.authenticate?(password: params[:password], username: params[:username])
      session[:username] = params[:username]
    elsif User.find_username?(username: params[:username])
      flash[:invalid_password] = "Incorrect password! Try again" 
    else 
      flash[:invalid_username] = "Username not found! Try again or Sign Up"
    end
    redirect '/'
  end     
end 

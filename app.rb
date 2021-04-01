require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require './database_setup'
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

  get '/login' do
    erb(:login)
  end

  post '/logout' do
    session.delete(:username)
    redirect '/'
  end

  get '/listing/new' do
    erb(:new_listing)
  end

  post '/add-listing' do
    Listing.add(title: params[:title], price: params[:price],
                description: params[:description], host_id: User.find_id(username: session[:username]))
    redirect '/'
  end

  get '/listing/:id' do
    @listing = Listing.find(id: params['id'])
    session[:listing] = @listing
    erb(:view_listing)
  end

  post '/user/new' do
    if User.find_username?(username: params[:username])
      flash[:username_in_use] = 'Username already in use; choose a different username or log-in'
      redirect '/sign_up'
    elsif User.find_email?(email: params[:email])
      flash[:email_in_use] = 'E-mail already in use; choose a different e-mail or log-in'
      redirect '/sign_up'
    end
    User.add(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:name] = params[:name]
    redirect '/'
  end

  post '/sessions' do
    if User.authenticate?(password: params[:password], username: params[:username])
      session[:username] = params[:username]
      redirect '/'
    elsif User.find_username?(username: params[:username])
      flash[:invalid_password] = 'Incorrect password! Try again'
    else
      flash[:invalid_username] = 'Username not found! Try again or Sign Up'
    end
    redirect '/login'
  end

  post '/booking' do
    session[:date] = params['date']
    flash[:booking] = "Thank you! Your booking request for #{session[:listing].title} on #{params['date']} has been sent."
    redirect '/listings'
  end
end 

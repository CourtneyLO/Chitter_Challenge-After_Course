ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/user.rb'
require 'data_mapper'


class Chitter < Sinatra::Base

enable :sessions
set :session_secret, 'super secret'


  get '/' do
    erb :'home_page'
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user' do
    @user = User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation])

  if @user.save
    session[:user_id] = @user.id
    session[:username] = @user.username
    redirect '/'
  else
    redirect '/user/new'
  end
end

helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

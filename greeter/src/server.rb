# The Greeter App
# Date: 07-May-2021
# Author: Ariel Ortiz

require 'sinatra'
require 'models/greeter_factory'

set :bind, '127.0.0.1'
set :port, ENV['PORT']
enable :sessions
set :session_secret, 'e73d1ce504d3fde4d3392583d2d5e9815af6bac0788589ab57c58576506fc983'

get '/' do
  @languages = GreeterFactory.available_languages
  erb :index
end

post '/' do
  session[:language] = params[:language] || 'English'
  redirect '/greet'
end

get '/greet' do
  @greeter = GreeterFactory.create(session[:language])
  erb :greet
end
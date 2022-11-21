# The Greeter App
# Date: 07-May-2021
# Author: Ariel Ortiz

require 'sinatra'
require 'json'
require 'faraday'

set :bind, '127.0.0.1'
set :port, ENV['PORT']

#Similar to sesion storage
enable :sessions

set :session_secret, 'e73d1ce504d3fde4d3392583d2d5e9815af6bac0788589ab57c58576506fc983'


# URL used to retrieve questions from aws lambda api
URL_API_QUESTIONS = 'https://mqrk5g6k2vx6ml7vt7y6ljhccy0karfu.lambda-url.us-east-1.on.aws/preguntas?n='


#Displays the main page index.html
get '/' do
  erb :index
end

#Receives POST requests from html forms
post '/' do
  #Stores the parameters in sesion storage.
  session[:questions] = params[:questions] || '1'

  puts "Questions to answer #{session[:questions]}"

  redirect '/quiz'
end


get '/quiz' do
  response = Faraday.get(URL_API_QUESTIONS+session[:questions])
  @info = []

  if response.success?
    @info= JSON.parse(response.body)
 end
  erb :quiz
end
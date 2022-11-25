# Final project
# Date: 29-Nov-2022
# Authors:
#          A01377950 Zabdiel Valentín Garduño Vivanco
#          A01377942 Luis Jonathan Rosas Ramos
#          A01377072 Emiliano Heredia García

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

#Global variable to store current question
$current_question

#Global variable to store current score
$current_score = { "correct" => 0, "incorrect" => 0, "total_questions" => 0 }

#Global boolean variable to store current answer
$was_correct

#Displays the main page index.html
get '/' do
  erb :index
end

#Receives POST requests from html forms
post '/' do
  questions = params[:questions] || '1'

  
  #Retrieves data drom API questions
  response = Faraday.get(URL_API_QUESTIONS+questions)

  if response.success?
    #Stores quiz in sesion storage.
    session[:quiz] = JSON.parse(response.body)

  end

  puts "Questions to answer #{questions}"
  $current_score["total_questions"]=questions

  redirect '/quiz'
end

#Returns the questions to answer. If there is no more questions, then returns the final feed back.
get '/quiz' do

  if session[:quiz].size>=1
    @info= session[:quiz].shift
    $current_question = @info
  
    erb :quiz
  else
    redirect '/final_feedback'
  end

end

#Checks if the answers was right or not,it stores the score in a global variable and current answer. Finally it goes to the question feedback.
post '/quiz' do

  p $current_question["correct-answer"]
  p params[:answer]

  if params[:answer] ==$current_question["correct-answer"]

    $current_score["correct"]=$current_score["correct"]+1
    $was_correct=true
  else
    $current_score["incorrect"]=$current_score["incorrect"]+1
    $was_correct=false
  end

  redirect '/feedback'

end


#Shows feedback about current question.
get '/feedback' do

  erb :feedback_question

end

#It goes to /quiz endponit to anwser the next question
post '/feedback' do

  redirect '/quiz'

end


#If user answered all questions then returns the final score.
get '/final_feedback' do

  erb :final_feedback

end


#Resets the current score and returns to the main page to answer more questions.
post '/final_feedback' do

  $current_score = { "correct" => 0, "incorrect" => 0, "total_questions" => 0 }

  redirect '/'
end
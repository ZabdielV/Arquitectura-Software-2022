# Final project
# Date: 29-Nov-2022
# Authors:
#          A01377950 Zabdiel Valentín Garduño Vivanco
#          A01377942 Luis Jonathan Rosas Ramos
#          A01377072 Emiliano Heredia García

#This class creates an API RESTFUL that stores and reads users with their scores.


require 'json'
require 'date'


#General handler that receives each HTTP request and returns a result.
def lambda_handler(event:, context:)

   path = event.dig('requestContext', 'http', 'path')
     case path
    when "/upload"
        handle_upload_users(event)
    when "/get"
        handle_get_users(event)
    else
        handle_bad_path(path)
    end
end

#Saves user responses
def handle_upload_users(event)
    rawJson = event.dig("body")

    ## {
    ##  "user": "id",
    ##  "correctAnswers": 5,
    ##  "totalAnswers": 10
    ## }
    ##
    json = JSON.parse(rawJson)
    region = 'us-west-2'
    client = Aws::DynamoDB::Client.new(region: region)
    
    
    client.put_item({
      table_name: 'users',
      item: JSON.generate(json)
    })

  {
    statusCode: 200
  }
end

#Retrives user responses
def handle_get_users(event)
  rawJson = event.dig("body")

  ## {
  ##  "user": "id"
  ## }
  json = JSON.parse(rawJson)

  region = 'us-west-2'
  client = Aws::DynamoDB::Client.new(region: region)
  
  result = client.get_item({
    table_name: 'users',
    item: JSON.generate(json)
  })
  

{
  statusCode: 200,
  body: JSON.generate(result)
}
end

handle_get_users


#Handles wrong requests.
def handle_bad_path(path)

        {
    statusCode: 404,
    headers: {
      "Content-Type" => "application/json; charset=utf-8"
    },
    body: JSON.generate({message: "Path not found: #{path}"})
  }
end




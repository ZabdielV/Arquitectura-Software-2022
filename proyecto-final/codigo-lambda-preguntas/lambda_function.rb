#This class creates an API RESTFUL that sends questions from a quiz.
#The user can retrieve all questions or n number of them.


# Returns all questions:
# https://mqrk5g6k2vx6ml7vt7y6ljhccy0karfu.lambda-url.us-east-1.on.aws/

# Returns n number of questions 
# https://mqrk5g6k2vx6ml7vt7y6ljhccy0karfu.lambda-url.us-east-1.on.aws/preguntas?n=2


require 'json'
require 'date'


#General handler that receives each HTTP request and returns a result.
def lambda_handler(event:, context:)

   path = event.dig('requestContext', 'http', 'path')
     case path
    #Regresa todas las preguntas en orden al azar
    when "/"
        handle_get_preguntas
    when "/preguntas"
        handle_get_n_preguntas(event)
    else
        handle_bad_path(path)
    end
end



#Return all questions in random order.
def handle_get_preguntas
    file = File.read('./preguntas.json')
    preguntas=JSON.parse(file)
    totalPreguntas=preguntas.size

    resultado=preguntas.sample(totalPreguntas)


  {
    statusCode: 200,
    body: JSON.generate(resultado)
  }

end

#Returns N number of questions in any order.
def handle_get_n_preguntas(event)
    file = File.read('./preguntas.json')
    n=event.dig("queryStringParameters","n") || "1"

    numero=n.to_i
    preguntas=JSON.parse(file)

     #Verificar que el numero este en un rango permitido
     if(numero < 0 or  numero>50)
         numero=1
     end

     resultado=preguntas.sample(numero)

     #resultado=JSON.dump(resultado)

  {
    statusCode: 200,
    body: JSON.generate(resultado)
  }

end

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




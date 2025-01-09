require 'webrick' # WEBrick is a lightweight HTTP server included in Ruby's standard library
require 'json' # Include the JSON module to enable Hash to be converted to JSON format
require_relative 'calculator' # Load the Calculator class for performing calculations

# Create an HTTP server listening on port 8080
server = WEBrick::HTTPServer.new(Port: 8080)

# Define an endpoint for calculating the square of a number
# This endpoint responds to requests at `/square`
server.mount_proc '/square' do |req, res|
  begin
    # Extract the 'number' query parameter from the request
    number = Integer(req.query['number'])
    # Calculate the square using the Calculator class
    result = Calculator.square(number)
    # Return the result as a JSON responser
    res['Content-Type'] = 'application/json' # Set the response content type to JSON
    res.body = { number: number, operation: 'square', result: result }.to_json
  rescue ArgumentError
    # Handle invalid input (e.g., when `number` is not an integer)
    res.status = 400 # Set HTTP status to 400 (Bad Request)
    res['Content-Type'] = 'application/json'
    res.body = { error: 'Invalid input. Please provide a valid number.' }.to_json
  end
end

# Define an endpoint for calculating the cube of a number
# This endpoint responds to requests at `/cube`
server.mount_proc '/cube' do |req, res|
  begin
    # Extract the 'number' query parameter from the request
    number = Integer(req.query['number'])
    # Calculate the cube using the Calculator class
    result = Calculator.cube(number)
    # Return the result as a JSON response
    res['Content-Type'] = 'application/json' # Set the response content type to JSON
    res.body = { number: number, operation: 'cube', result: result }.to_json
  rescue ArgumentError
    # Handle invalid input (e.g., when `number` is not an integer)
    res.status = 400 # Set HTTP status to 400 (Bad Request)
    res['Content-Type'] = 'application/json'
    res.body = { error: 'Invalid input. Please provide a valid number.' }.to_json
  end
end

# Set up a trap to gracefully shut down the server when the script is interrupted (e.g., Ctrl+C)
trap('INT') { server.shutdown }

# Start the HTTP server
server.start
http = require 'http'

app = http.createServer (request, response) ->
  response.writeHead 200, {"Content-Type": "text/plain"}
  response.end "Hello, world!"

  console.log request.headers['x-git-event']
  console.log request.method

app.listen 3000

console.log "Server running at http://localhost:3000"
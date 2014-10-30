http = require 'http'
git = require './git'
gource = require './gource'

do git
do gource

now = new Date().getTime()

app = http.createServer (request, response) ->
  response.writeHead 200, {"Content-Type": "text/plain"}
  response.end()

  if event = request.headers['x-git-event']? or event = request.headers['x-github-event']?
    if event is 'push'
      console.log "updating git"
      repo = do git.update

app.listen 3000

console.log "Server running at http://localhost:3000"
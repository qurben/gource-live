http = require 'http'
git = require './controller/git'
gource = require './controller/gource'

do git
do gource

now = new Date().getTime()

app = http.createServer (request, response) ->
  request.on 'data', (data) ->
    console.log data.toString()
    gource.update(data.toString())

  request.on 'end', ->
    response.writeHead 200, {'Content-Type': 'text/plain'}
    response.write 'OK'
    response.end()

  if event = request.headers['x-git-event']? or event = request.headers['x-github-event']?
    if event is 'push'
      console.log "updating git"
      repo = do git.update

app.listen 3000

console.log "Server running at http://localhost:3000"
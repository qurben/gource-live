exec = require('child_process').exec


gource = (repo) ->
  exec 'gource', (error, stdout, stderr) ->
    console.log('stdout: ' + stdout)
    console.log('stderr: ' + stderr)

    if error isnt null
      console.log 'exec error ' + error

module.exports = gource
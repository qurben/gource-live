exec = require('child_process').exec
spawn = require('child_process').spawn

gource_child = null

gource = (repo) ->
  gource_child = spawn 'gource.cmd',
    [
      '--log-format', 'custom',
      '--file-idle-time', '0',
      '--max-file-lag', '0.1',
      '-'
    ]

  exec 'git --git-dir .repo/.git ls-files', (error, stdout, stderr) ->
    for line in stdout.split('\n')
      console.log line
      gource_child.stdin.write("#{new Date().getTime()+1000}||A|#{line}\n")

  gource_child.stdout.on 'data', (data) ->
    console.log data.toString()

  gource_child.stderr.on 'data', (data) ->
    console.log "error: #{data}"

  gource_child.on 'close', (code) ->
    console.log "closing code: #{code}"


gource.update = (message) ->
  gource_child.stdin.write("#{message}")

module.exports = gource
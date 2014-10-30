gift = require 'gift'
config = require './config'
fs = require 'fs'

loaded = false

timestamp =

git = () ->
  unless fs.existsSync('#{config.repo_dir}/.git')
    gift.clone config.repo, config.repo_dir, (err, _repo) ->
      loaded = true unless err

git.update = () ->
  if loaded
   return gift config.repo_dir

  return false

module.exports = git

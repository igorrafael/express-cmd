
spawn = require('child_process').spawn
express = require('express')
_ = require('lodash')
router = express.Router()
running = []
closed = []

router.get '/stats', (req, res) ->
  res.status(200).json
    running: _.map(running, 'pid')
    closed: _.map(closed, 'out')

router.get '/:cmd', (req, res) ->
  args = _.map (_.omit req.query, ['cwd']), _.identity
  child = spawn req.params.cmd, args,
    cwd: req.query.cwd
  running.push child
  child.on 'error', (err) ->
    res.status(500).json
      err: err
  child.on 'close', ->
    running = _.remove(running, child.pid)
    closed.push child
    res.status(200).json
      args: args
      cwd: req.query.cwd
      output: child.out
  child.stdout.on 'data', (data) ->
    child.out = ('' + data).split('\n')
  child.stderr.on 'data', (data) ->
    child.out = ('' + data).split('\n')

module.exports = router

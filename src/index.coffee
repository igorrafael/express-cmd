
spawn = require('child_process').spawn
express = require('express')
_ = require('lodash')
router = express.Router()
running = []
closed = []
router.get '/:cmd', (req, res) ->
  args = []
  child = spawn(req.params.cmd, _.map(req.query,_.identity))
  running.push child
  child.on 'close', ->
    running = _.remove(running, child.pid)
    closed.push child
    res.status(200).json
      args: args
      query: req.query
      output: child.out
  child.stdout.on 'data', (data) ->
    console.log 'stdout: ' + data
    child.out = ('' + data).split('\n')
  child.stderr.on 'data', (data) ->
    console.log 'stderr: ' + data
    child.out = ('' + data).split('\n')

router.get '/stats', (req, res) ->
  res.status(200).json
    running: _.map(running, 'pid')
    closed: _.map(closed, 'out')

module.exports = router

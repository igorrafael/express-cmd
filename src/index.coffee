
spawn = require('child_process').spawn
express = require('express')
_ = require('lodash')
router = express.Router()
running = []
closed = []
router.get '/ls', (req, res) ->
    args = []
    child = spawn('ls', [ '-lha' ])
    running.push child
    child.on 'close', ->
        running = _.remove(running, child.pid)
        closed.push child
        return
    child.stdout.on 'data', (data) ->
        console.log 'stdout: ' + data
        child.out = ('' + data).split('\n')
        return
    child.stderr.on 'data', (data) ->
        console.log 'stderr: ' + data
        child.out = ('' + data).split('\n')
        return
    res.status(200).json
        query: req.query
        args: args
    return

router.get '/stats', (req, res) ->
    res.status(200).json
        running: _.map(running, 'pid')
        closed: _.map(closed, 'out')
    return

module.exports = router

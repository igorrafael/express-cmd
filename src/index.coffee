express = require("express")
_ = require("lodash")
Process = require "./Process"

router = express.Router()
running = []
closed = []

router.get "/stats", (req, res) ->
  res.status(200).json
    running: _.map(running, "pid")
    closed: _.map(closed, "out")

router.get "/:cmd", (req, res) ->
  args = _.map (_.omit req.query, ["cwd"]), _.identity
  child = new Process req.params.cmd, args,
    cwd: req.query.cwd
    callback: (error, data) ->
      closed.push data
      running = _.remove(running, child)
      if error? then res.status(500)
      else res.status(200)
      res.json
        error: error
        data: data
  running.push child

module.exports = router

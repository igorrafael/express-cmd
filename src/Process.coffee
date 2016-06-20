spawn = require("child_process").spawn
_ = require("lodash")

Function::property = (prop, desc) ->
  Object.defineProperty @prototype, prop, desc

module.exports = class Process
  constructor: (@command, @arguments, @options) ->
    @output = []
    @process = spawn @command, @arguments, @options
    @process.stdout.on "data", @append
    @process.stderr.on "data", @append
    @process.on "error", (error) => @callback? error, @data
    @process.on "close", => @callback? undefined, @data

    @callback = (args...) ->
      @options.callback args...
      @callback = null

  append: (data) =>
    lines = data.toString().split "\n"
    @output = _.concat @output, lines

  @property "data",
    get: -> _.omit this, ["process","callback"]

# require('lib/setup')
# 
# Spine = require('spine')
# 
# class App extends Spine.Controller
  # constructor: ->
    # super
    # @log("Initialised")
# 
# module.exports = App
#     

require('lib/setup')

Spine    = require('spine')
Entrants = require('controllers/entrants')

class App extends Spine.Controller
  constructor: ->
    super
    @entrants = new Entrants
    @append @entrants

    Spine.Route.setup()

module.exports = App

# Spine = require('spine')
# 
# class Entrants extends Spine.Controller
  # constructor: ->
    # super
    # @log('yo')
#     
# module.exports = Entrants


Spine   = require('spine')
Entrant = require('models/entrant')
$       = Spine.$

Main    = require('controllers/entrants_main')
Sidebar = require('controllers/entrants_sidebar')

class Entrants extends Spine.Controller
  className: 'entrants'

  constructor: ->
    super

    @sidebar = new Sidebar
    @main    = new Main

    @routes
      '/entrants/:id/edit': (params) -> 
        @sidebar.active(params)
        @main.edit.active(params)
      '/entrants/:id': (params) ->
        @sidebar.active(params)
        @main.show.active(params)

    @append @sidebar, @main

    Entrant.fetch()

module.exports = Entrants
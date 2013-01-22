Spine = require('spine')

class Entrant extends Spine.Model
  # Configure name & attributes
  @configure 'Entrant', 'name', 'number'

  # Persist with Local Storage
  @extend @Local

  @filter: (query) ->
    return @all() unless query
    query = query.toLowerCase()
    @select (item) ->
      item.name?.toLowerCase().indexOf(query) isnt -1 or
        item.number?.toLowerCase().indexOf(query) isnt -1

module.exports = Entrant
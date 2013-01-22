Spine = require('spine')

# class EntrantsSidebar extends Spine.Controller
  # constructor: ->
    # super
#     
# module.exports = EntrantsSidebar
# 


Spine   = require('spine')
Entrant = require('models/entrant')
List    = require('spine/lib/list')
$       = Spine.$



class Sidebar extends Spine.Controller
  className: 'sidebar'

  elements:
    '.items': 'items'
    'input[type=search]': 'search'

  events:
    'keyup input[type=search]': 'filter'
    'click footer button': 'create'

  constructor: ->
    super
    # Render initial view
    @html require('views/sidebar')()

    # Setup a Spine List
    @list = new List
      el: @items, 
      template: require('views/item'), 
      selectFirst: true

    @list.bind 'change', @change

    @active (params) -> 
      @list.change(Entrant.find(params.id))

    Entrant.bind('refresh change', @render)

  filter: ->
    @query = @search.val()
    @render()

  render: =>
    entrants = Entrant.filter(@query)
    @list.render(entrants)

  change: (item) =>
    @navigate '/entrants', item.id

  create: ->
    item = Entrant.create()
    @navigate('/entrants', item.id, 'edit')

module.exports = Sidebar
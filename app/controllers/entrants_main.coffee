Spine = require('spine')
Entrant = require('models/entrant')
$       = Spine.$



class Show extends Spine.Controller
  # Set the HTML class
  className: 'show'

  events:
    'click .edit': 'edit'

  constructor: ->
    super

    # Bind the change() callback
    # to the *active* event
    @active @change

  render: ->
    # Render a template, replacing the 
    # controller's HTML
    @html require('views/show')(@item)

  change: (params) =>
    @item = Entrant.find(params.id)
    @render()

  edit: ->
    # Navigate to the 'edit' view whenever
    # the edit link is clicked
    @navigate('/entrants', @item.id, 'edit')
    
    
    
class Edit extends Spine.Controller
  className: 'edit'

  events:
    'submit form': 'submit'
    'click .save': 'submit'
    'click .delete': 'delete'

  elements: 
    'form': 'form'

  constructor: ->
    super
    @active @change

  render: ->
    @html require('views/form')(@item)

  change: (params) =>
    @item = Entrant.find(params.id)
    @render()

  submit: (e) ->
    e.preventDefault()
    @item.fromForm(@form).save()
    @navigate('/entrants', @item.id)

  delete: ->
    @item.destroy() if confirm('Are you sure?')
    
    
class Main extends Spine.Stack
  controllers:
    show: Show
    edit: Edit

module.exports = Main
    
   
# class EntrantsMain extends Spine.Controller
  # constructor: ->
    # super
#     
# module.exports = EntrantsMain
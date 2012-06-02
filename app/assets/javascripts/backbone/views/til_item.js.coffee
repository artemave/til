class TilApp.Views.TilsIndexItem extends Support.CompositeView
  tagName: 'tr'

  events:
    'click': 'redirect_to_show_til'

  initialize: (opts = {}) ->
    @model = opts.model
    @navigate = opts.navigate || TilApp.navigate

  render: ->
    $(@el).html(JST['tils/item'](model: @model))
    this

  redirect_to_show_til: ->
    @navigate("tils/#{@model.id}", trigger: true)

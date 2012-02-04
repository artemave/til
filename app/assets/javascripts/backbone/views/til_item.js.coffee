class TilApp.Views.TilsIndexItem extends Support.CompositeView
  tagName: 'tr'

  initialize: (opts = {}) ->
    @model = opts.model

  render: ->
    $(@el).html(JST['tils/item'](model: @model))
    this


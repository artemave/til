class TilApp.Views.TilsIndex extends Support.CompositeView
  id: 'tils'

  initialize: (opts = {})->
    @collection = opts.collection || []
    $('#main').append(@el)

  render: ->
    @renderTemplate()
    if @collection.length > 0
      @renderTils()

  renderTemplate: ->
    $(@el).html(JST['tils/index']())

  renderTils: ->
    @collection.each (til) =>
      row = new TilApp.Views.TilsIndexItem(model: til)
      @renderChild(row)
      @$('tbody').append(row.el)

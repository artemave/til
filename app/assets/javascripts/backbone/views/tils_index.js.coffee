class TilApp.Views.TilsIndex extends Support.CompositeView
  id: 'tils'

  render: ->
    @renderTemplate()
    @renderTils()
    $('body').append(@el)

  renderTemplate: ->
    $(@el).html(JST['tils/index']())

  renderTils: ->
    @collection.each (til) =>
      row = new TilApp.Views.TilItem(model: til)
      @renderChild(row)
      @$('tbody').append(row.el)

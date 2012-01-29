class TilApp.Views.TilsIndex extends Backbone.View
  id: 'tils'

  render: ->
    $(@el).html(JST['tils/index']())
    $('body').append(@el)

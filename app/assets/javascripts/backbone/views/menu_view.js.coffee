class TilApp.Views.Menu extends Backbone.View
  el: '#til_button_bar'

  render: ->
    @$el.html(JST['menu']())
    @

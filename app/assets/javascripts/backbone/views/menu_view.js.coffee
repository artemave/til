class DevNotesApp.Views.Menu extends Backbone.View
  el: '#note_button_bar'

  render: ->
    @$el.html(JST['menu']())
    @

  @Factory: ->
    create: ->
      new Menu

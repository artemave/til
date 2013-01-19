class DevNotesApp.Views.Menu extends Backbone.View
  el: '#note_button_bar'

  initialize: ->
    _.bindAll(@, 'trigger_search')

  events:
    'input .search-query': 'trigger_search'

  render: ->
    @$el.html(JST['menu']())
    @

  trigger_search: ->
    query = @$el.find('input.search-query').val()
    DevNotesApp.Notifications.trigger 'search', query
    false

  @Factory: ->
    create: ->
      new Menu

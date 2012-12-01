#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.DevNotesApp =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  Notifications: _.extend({}, Backbone.Events)
  bodySelector: '#main .row'

  init: (opts = {}) ->
    @notesCollection = new DevNotesApp.Collections.NotesCollection(opts.notes || [])

    router = ( opts.notes_router_factory || new DevNotesApp.Routers.NotesRouter.Factory ).create
      notes_collection: @notesCollection

    @navigate = router.navigate

    menu_factory = opts.menu_factory || new DevNotesApp.Views.Menu.Factory
    @menu_view = menu_factory.create()
    @menu_view.render()

    notes_index_factory = opts.notes_index_factory || new DevNotesApp.Views.NotesIndex.Factory
    @notes_index_view = notes_index_factory.create(collection: @notesCollection)
    $(@bodySelector).append(@notes_index_view.render().el)
    $(@bodySelector).append($('<div id="note_details">'))

    history = opts.history || Backbone.history
    if not history.started
      history.start()
      history.started = true

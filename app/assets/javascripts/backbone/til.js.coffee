#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.TilApp =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  bodySelector: '#main .row'

  init: (opts = {}) ->
    @tilsCollection = new TilApp.Collections.TilsCollection(opts.tils || [])
    
    router = ( opts.tils_router_factory || new TilApp.Routers.TilsRouter.Factory ).create()
    @navigate = router.navigate

    menu_factory = opts.menu_factory || new TilApp.Views.Menu.Factory
    @menu_view = menu_factory.create()
    @menu_view.render()

    tils_index_factory = opts.tils_index_factory || new TilApp.Views.TilsIndex.Factory
    @tils_index_view = tils_index_factory.create(collection: @tilsCollection)
    $(@bodySelector).append(@tils_index_view.render().el)
    $(@bodySelector).append($('<div id="note_details">'))

    history = opts.history || Backbone.history
    if not history.started
      history.start()
      history.started = true

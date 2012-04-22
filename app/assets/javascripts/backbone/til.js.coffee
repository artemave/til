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

  init: (tils, opts = {}) ->
    @tilsCollection = new TilApp.Collections.TilsCollection(tils || [])
    
    ( opts.tils_router_factory || new TilApp.Routers.TilsRouter.Factory ).create()

    history = opts.history || Backbone.history

    if not history.started
      history.start()
      history.started = true

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

  init: (tils = []) ->
    @tilsCollection = new TilApp.Collections.TilsCollection(tils)

    new TilApp.Routers.TilsRouter()
    new TilApp.Routers.MenuRouter()

    if not Backbone.history.started
      Backbone.history.start()
      Backbone.history.started = true

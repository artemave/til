#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Til =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

  init: (tils = []) ->
    @tilsCollection = new Til.Collections.TilsCollection(tils)

    new Til.Routers.TilsRouter()

    if not Backbone.history.started
      Backbone.history.start()
      Backbone.history.started = true

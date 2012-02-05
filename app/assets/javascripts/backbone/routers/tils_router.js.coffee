class TilApp.Routers.TilsRouter extends Backbone.Router
  initialize: (options) ->

  routes:
    "": "index"
  
  index: ->
    view = new TilApp.Views.TilsIndex(collection: TilApp.tilsCollection)
    view.render()

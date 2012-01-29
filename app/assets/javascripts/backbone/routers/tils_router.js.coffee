class TilApp.Routers.TilsRouter extends Backbone.Router
  initialize: (options) ->

  routes:
    "": "index"
  
  index: ->
    new TilApp.Views.TilsIndex()

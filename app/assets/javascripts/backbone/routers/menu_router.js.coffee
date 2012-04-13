class TilApp.Routers.MenuRouter extends Backbone.Router
  initialize: (options) ->
    @menu_view = new TilApp.Views.Menu()

  routes:
    "": "index"
  
  index: ->
    @menu_view.render()

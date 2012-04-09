class Tillit.Routers.MenuRouter extends Support.SwappingRouter
  initialize: (options) ->

  routes:
    "": "index"
  
  index: ->
    @swap(new MenuView(new: true))

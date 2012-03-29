class TilApp.Routers.TilsRouter extends Backbone.Router
  initialize: (options) ->

  routes:
    "": "index"
  
  index: ->
    index = new TilApp.Views.TilsIndex(collection: TilApp.tilsCollection)
    $('#main').append(index.render().el)
    $(document).trigger('load_pagedown_editor')

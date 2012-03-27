class TilApp.Routers.TilsRouter extends Backbone.Router
  initialize: (options) ->

  routes:
    "": "index"
  
  index: ->
    index = new TilApp.Views.TilsIndex(collection: TilApp.tilsCollection)
    $('#main').append(index.render().el)
    convertor = Markdown.getSanitizingConverter()
    editor = new Markdown.Editor(convertor)
    editor.run()


class TilApp.Routers.TilsRouter extends Backbone.Router
  _main_row_selector = '#main .row'

  initialize: (options) ->

  routes:
    "": "index"
    "new": "new"

  new: ->
    @createNewTilForm()
  
  index: ->
    @createTilsIndex()

  createTilsIndex: ->
    index = new TilApp.Views.TilsIndex(collection: TilApp.tilsCollection)
    $(_main_row_selector).append(index.render().el)

  createNewTilForm: ->
    new_til_form = new TilApp.Views.TilForm()
    $(_main_row_selector).append(new_til_form.render().el)
    $(new_til_form).trigger('load_pagedown_editor')

class TilApp.Routers.TilsRouter extends Backbone.Router
  _main_row_selector = '#main .row'

  initialize: (options) ->
    @menu_view = new TilApp.Views.Menu()
    @menu_view.render()
    @createTilsIndex()

  routes:
    "": "index"
    "new": "new"

  new: ->
    @createNewTilForm()
  
  index: ->
    @showLastModifiedTil()

  createTilsIndex: ->
    index = new TilApp.Views.TilsIndex(collection: TilApp.tilsCollection)
    $(_main_row_selector).append(index.render().el)

  createNewTilForm: ->
    if @show_til_view
      @show_til_view.leave()

    @new_til_view = new TilApp.Views.TilForm()
    $(_main_row_selector).append(@new_til_view.render().el)
    $(@new_til_view).trigger('load_pagedown_editor')

  showLastModifiedTil: ->
    if @new_til_view
      @new_til_view.leave()

    last_modified_til = TilApp.tilsCollection.max (t) -> t.updated_at

    if last_modified_til
      @show_til_view = new TilApp.Views.ShowTil(til: last_modified_til)
      $(_main_row_selector).append(@show_til_view.render().el)

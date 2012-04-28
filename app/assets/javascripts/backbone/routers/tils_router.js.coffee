class TilApp.Routers.TilsRouter extends Backbone.Router
  routes:
    "": "index"
    "new": "new"

  new: ->
    @createNewTilForm()
  
  index: ->
    @showLastModifiedTil()

  createNewTilForm: ->
    if @show_til_view
      @show_til_view.leave()

    @new_til_view = new TilApp.Views.TilForm()
    $(TilApp.bodySelector).append(@new_til_view.render().el)
    $(@new_til_view).trigger('load_pagedown_editor')

  showLastModifiedTil: ->
    if @new_til_view
      @new_til_view.leave()

    last_modified_til = TilApp.tilsCollection.max (t) -> t.updated_at

    if last_modified_til
      @show_til_view = new TilApp.Views.ShowTil(til: last_modified_til)
      $(TilApp.bodySelector).append(@show_til_view.render().el)

  @Factory: ->
    create: () ->
      new TilsRouter()


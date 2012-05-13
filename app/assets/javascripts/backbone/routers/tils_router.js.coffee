class TilApp.Routers.TilsRouter extends Backbone.Router
  @Factory: ->
    create: () ->
      new TilsRouter()

  initialize: (opts = {}) ->
    navigate = opts.navigate || @navigate

    @createNewTilForm = ->
      if @show_til_view
        @show_til_view.leave()

      @new_til_view = new TilApp.Views.TilForm()
      $(TilApp.bodySelector).append(@new_til_view.render().el)
      $(@new_til_view).trigger('load_pagedown_editor')

    @redirectToShowLastModifiedTil = ->
      if @new_til_view
        @new_til_view.leave()

      last_modified_til = TilApp.tilsCollection.last_modified_til()

      if last_modified_til
        navigate("tils/#{last_modified_til.id}", trigger: true)

  routes:
    "": "root"
    "new": "new"
    "tils/:id": "show"

  root: ->
    @redirectToShowLastModifiedTil()

  new: ->
    @createNewTilForm()

  show: (id) ->
    if @show_til_view
      @show_til_view.leave()

    @show_til_view = new TilApp.Views.ShowTil(til: TilApp.tilsCollection.get(id))
    $(TilApp.bodySelector).append(@show_til_view.render().el)
  


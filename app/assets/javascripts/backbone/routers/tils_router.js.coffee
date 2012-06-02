class TilApp.Routers.TilsRouter extends Support.SwappingRouter
  @Factory: ->
    create: ->
      new TilsRouter

  initialize: (opts = {}) ->
    navigate = opts.navigate || @navigate
    @til_form_view_factory = opts.til_form_view_factory || new TilApp.Views.TilForm.Factory
    @el = opts.el || '#note_details'

    @redirectToShowLastModifiedTil = ->
      last_modified_til = TilApp.tilsCollection.last_modified_til()

      if last_modified_til
        navigate("tils/#{last_modified_til.id}", trigger: true)

  routes:
    "": "root"
    "new": "new"
    "tils/:id": "show"
    "tils/:id/edit": "edit"

  root: ->
    @redirectToShowLastModifiedTil()

  new: ->
    new_til_view = @til_form_view_factory.create()
    @swap(new_til_view)
    $(new_til_view).trigger('load_pagedown_editor')

  show: (id) ->
    show_til_view = new TilApp.Views.ShowTil(til: TilApp.tilsCollection.get(id))
    @swap(show_til_view)
  
  edit: (id) ->
    edit_til_view = @til_form_view_factory.createEdit(TilApp.tilsCollection.get(id))
    @swap(edit_til_view)
    $(edit_til_view).trigger('load_pagedown_editor')

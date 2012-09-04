class DevNotesApp.Routers.NotesRouter extends Support.SwappingRouter
  @Factory: ->
    create: ->
      new NotesRouter

  initialize: (opts = {}) ->
    navigate                = opts.navigate || @navigate
    @note_form_view_factory = opts.note_form_view_factory || new DevNotesApp.Views.NoteForm.Factory
    @show_note_view_factory = opts.show_note_view_factory || new DevNotesApp.Views.ShowNote.Factory
    @el                     = opts.el || '#note_details'

    # this is here so that I don't have to override @navigate
    @redirectToShowLastModifiedNote = ->
      last_modified_note = DevNotesApp.notesCollection.last_modified_note()

      if last_modified_note
        navigate("notes/#{last_modified_note.id}", trigger: true)

  routes:
    "": "root"
    "new": "new"
    "notes/:id": "show"
    "notes/:id/edit": "edit"

  root: ->
    @redirectToShowLastModifiedNote()

  new: ->
    new_note_view = @note_form_view_factory.create()
    @swap(new_note_view)
    $(new_note_view).trigger('load_pagedown_editor')

  show: (id) ->
    show_note_view = @show_note_view_factory.create(DevNotesApp.notesCollection.get(id))
    @swap(show_note_view)
  
  edit: (id) ->
    edit_note_view = @note_form_view_factory.createEdit(DevNotesApp.notesCollection.get(id))
    @swap(edit_note_view)
    $(edit_note_view).trigger('load_pagedown_editor')

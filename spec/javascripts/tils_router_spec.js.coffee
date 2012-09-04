describe 'DevNotesApp.Routers.NotesRouter', ->
  it 'roots to redirecting to show last modified note', ->
    navigate = @spy()
    @stub(DevNotesApp.notesCollection, 'last_modified_note').returns(new DevNotesApp.Models.Note(_id: 1, content: 'sweet'))

    router = new DevNotesApp.Routers.NotesRouter(navigate: navigate)
    router.root()

    expect(navigate).toHaveBeenCalledWith("notes/1", trigger: true)

  describe '#new', ->
    it 'displays new note form', ->
      setFixtures sandbox()
      DevNotesApp.bodySelector = '#sandbox'

      note_form_view = { render: @stub().returns(el: 'form') }
      note_form_view_factory = { create: @stub().returns(note_form_view) }

      spyOnEvent($(note_form_view), 'load_pagedown_editor')

      router = new DevNotesApp.Routers.NotesRouter(note_form_view_factory: note_form_view_factory, el: '#sandbox')
      router.new()

      expect($('#sandbox')).toHaveText(/form/)
      expect('load_pagedown_editor').toHaveBeenTriggeredOn($(note_form_view))

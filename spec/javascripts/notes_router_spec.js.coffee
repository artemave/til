describe 'DevNotesApp.Routers.NotesRouter', ->
  beforeEach ->
    setFixtures sandbox()
    DevNotesApp.bodySelector = '#sandbox'
    @note = new DevNotesApp.Models.Note(_id: 1)

  it 'roots to redirecting to show last modified note', ->
    navigate = @spy()
    @stub(DevNotesApp.notesCollection, 'last_modified_note').returns(@note)

    router = new DevNotesApp.Routers.NotesRouter(navigate: navigate)
    router.root()

    expect(navigate).toHaveBeenCalledWith("notes/1", trigger: true)

  describe '#new', ->
    it 'displays new note form', ->
      note_form_view = { render: @stub().returns(el: 'form') }
      note_form_view_factory = { create: @stub().returns(note_form_view) }

      spyOnEvent($(note_form_view), 'load_pagedown_editor')

      router = new DevNotesApp.Routers.NotesRouter(note_form_view_factory: note_form_view_factory, el: '#sandbox')
      router.new()

      expect($('#sandbox')).toHaveText(/form/)
      expect('load_pagedown_editor').toHaveBeenTriggeredOn($(note_form_view))

  describe '#edit', ->
    it 'displays edit note form', ->
      @stub(DevNotesApp.notesCollection, 'get').withArgs(1).returns(@note)

      note_form_view = { render: @stub().returns(el: 'form') }
      note_form_view_factory = { createEdit: @stub().withArgs(@note).returns(note_form_view) }

      spyOnEvent($(note_form_view), 'load_pagedown_editor')

      router = new DevNotesApp.Routers.NotesRouter(note_form_view_factory: note_form_view_factory, el: '#sandbox')
      router.edit(1)

      expect($('#sandbox')).toHaveText(/form/)
      expect('load_pagedown_editor').toHaveBeenTriggeredOn($(note_form_view))

  describe '#show', ->
    it 'shows note content', ->
      @stub(DevNotesApp.notesCollection, 'get').withArgs(1).returns(@note)

      show_note_view = { render: @stub().returns(el: 'form') }
      show_note_view_factory = { create: @stub().withArgs(@note).returns(show_note_view) }

      router = new DevNotesApp.Routers.NotesRouter(show_note_view_factory: show_note_view_factory, el: '#sandbox')
      router.show(1)

      expect($('#sandbox')).toHaveText(/form/)

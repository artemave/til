describe 'DevNotesApp.Routers.NotesRouter', ->
  beforeEach ->
    setFixtures sandbox()
    DevNotesApp.bodySelector = '#sandbox'
    @note = new DevNotesApp.Models.Note(_id: 1, content: 'first note')
    @notes = new DevNotesApp.Collections.NotesCollection [
      { _id: 2, content: 'sparrow is an excellent email client with seamless gmail support' },
      { _id: 3, content: 'alfred is a nice spotlite alternative' }
    ]
    @notes.add(@note)

  describe '#root', ->
    it 'roots to show last modified note', ->
      navigate = @stub()
      @stub(@notes, 'last_modified_note').returns(@note)
      router = new DevNotesApp.Routers.NotesRouter(notes_collection: @notes, navigate: navigate)

      router.root()

      expect(navigate).toHaveBeenCalledWith("notes/1", trigger: true)

    it "roots to new note if there are no notes", ->
      navigate = @spy()
      @notes.reset()
      router = new DevNotesApp.Routers.NotesRouter(notes_collection: @notes, navigate: navigate)

      router.root()

      expect(navigate).toHaveBeenCalledWith("new", trigger: true)

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
      note_form_view = { render: @stub().returns(el: 'form') }
      note_form_view_factory = { createEdit: @stub().withArgs(@note).returns(note_form_view) }

      spyOnEvent($(note_form_view), 'load_pagedown_editor')

      router = new DevNotesApp.Routers.NotesRouter(note_form_view_factory: note_form_view_factory, el: '#sandbox', notes_collection: @notes)
      router.edit(1)

      expect($('#sandbox')).toHaveText(/form/)
      expect('load_pagedown_editor').toHaveBeenTriggeredOn($(note_form_view))

  describe '#show', ->
    it 'shows note content', ->
      show_note_view = { render: @stub().returns(el: 'form') }
      show_note_view_factory = { create: @stub().withArgs(@note).returns(show_note_view) }

      router = new DevNotesApp.Routers.NotesRouter(show_note_view_factory: show_note_view_factory, el: '#sandbox', notes_collection: @notes)
      router.show(1)

      expect($('#sandbox')).toHaveText(/form/)

  describe '#delete', ->
    beforeEach ->
      @server = sinon.fakeServer.create()

    afterEach ->
      @server.restore()

    it 'deletes note', ->
      @spy(@note, 'destroy')
      router = new DevNotesApp.Routers.NotesRouter(notes_collection: @notes)
      router.delete(1)
      expect(@note.destroy).toHaveBeenCalled()

    it 'redirects to notes index', ->
      navigate = @stub()
      @server.respondWith('DELETE', /.*/, [200, { "Content-Type": "application/json" }, '{}'])

      router = new DevNotesApp.Routers.NotesRouter(notes_collection: @notes, navigate: navigate)
      router.delete(1)

      @server.respond()

      expect(navigate).toHaveBeenCalledWith("", trigger: true)



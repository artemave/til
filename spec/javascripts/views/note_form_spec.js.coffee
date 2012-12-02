describe 'DevNotesApp.Views.NoteForm', ->
  load_pagedown_editor = null
  $sandbox             = null

  beforeEach ->
    setFixtures sandbox()
    $sandbox = $('#sandbox')

    sinon.stub _, 'defer', (callback) ->
      load_pagedown_editor = callback

  afterEach ->
    _.defer.restore()

  describe 'New note', ->
    it 'shows blank editor form', ->
      new_note = new DevNotesApp.Views.NoteForm()

      $sandbox.html new_note.render().el
      load_pagedown_editor()

      expect($sandbox).toContain('textarea')
      expect($sandbox.find('button[type="submit"]')).toHaveText(/Create/)

    it 'creates new note', ->
      notes_collection = create: @spy(), get: ->
      note_form = new DevNotesApp.Views.NoteForm(notes_collection: notes_collection)

      $sandbox.html note_form.render().el
      load_pagedown_editor()

      $sandbox.find('textarea').val('content')
      $sandbox.find('button:contains("Create")').click()

      expect(notes_collection.create).toHaveBeenCalledWith(content: 'content')

    it 'switches to edit mode after create', ->
      navigate = @spy()
      note_form = new DevNotesApp.Views.NoteForm
        navigate: navigate,
        notes_collection: new DevNotesApp.Collections.NotesCollection

      $sandbox.html note_form.render().el
      load_pagedown_editor()

      $sandbox.find('textarea').val('content')
      $sandbox.find('button:contains("Create")').click()

      @server.respond [
        201,
        { "Content-Type": "application/json" },
        JSON.stringify {"id":2,"content":"content","updated_at":"2012-10-13T22:45:43Z","created_at":"2012-10-13T22:45:43Z"}
      ]

      expect(navigate).toHaveBeenCalledWith("notes/2/edit", trigger: true)

  describe 'Edit note', ->
    it 'shows editor form with contents of edited note', ->
      form_factory = new DevNotesApp.Views.NoteForm.Factory
      note_form = form_factory.createEdit(new DevNotesApp.Models.Note(content: 'note content'))

      $sandbox.html note_form.render().el
      load_pagedown_editor()

      expect($sandbox.find('textarea')).toHaveText(/note content/)

    it 'updates existing note', ->
      note = new DevNotesApp.Models.Note(content: 'old text')
      @stub note, 'set', ->
      @stub note, 'save', ->
      @stub(note, 'isNew').returns(false)

      notes_collection = get: @stub().withArgs(note.id).returns(note)

      form_factory = new DevNotesApp.Views.NoteForm.Factory()
      note_form    = form_factory.createEdit(note, notes_collection: notes_collection)

      $sandbox.html note_form.render().el
      load_pagedown_editor()

      $sandbox.find('textarea').val('new text')
      $sandbox.find('button:contains("Save")').click()

      expect(note.set).toHaveBeenCalledWith('content', 'new text')
      expect(note.save).toHaveBeenCalled()
      expect(note.set).toHaveBeenCalledBefore(note.save)

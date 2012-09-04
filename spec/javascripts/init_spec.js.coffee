describe "Note", ->
  describe "init", ->
    it 'initializes NOTEs collection', ->
      DevNotesApp.init notes: [
          {content: "awesome", updated_at: '2012-01-01T00:00:00Z'},
          {content: "blah", updated_at: '2012-01-01T00:00:05Z'}
        ]

      expect(DevNotesApp.notesCollection).toBeDefined()
      expect(DevNotesApp.notesCollection.length).toEqual(2)
      expect(DevNotesApp.notesCollection.models[0].get('content')).toEqual("awesome")
      expect(DevNotesApp.notesCollection.models[1].get('content')).toEqual("blah")

    it 'creates notes router', ->
      notes_router_factory = { create: @stub().returns(navigate: 'navigate') }
      DevNotesApp.init(notes_router_factory: notes_router_factory)
      expect(notes_router_factory.create).toHaveBeenCalled()

    it 'sets global navigate', ->
      notes_router_factory = { create: @stub().returns(navigate: 'navigate') }
      DevNotesApp.init(notes_router_factory: notes_router_factory)
      expect(DevNotesApp.navigate).toEqual('navigate')

    it 'starts backbone history', ->
      history = { start: @spy() }

      DevNotesApp.init(history: history)
      expect(history.start).toHaveBeenCalled()

    it 'creates menu', ->
      menu = { render: @spy() }
      menu_factory = { create: @stub().returns(menu) }

      DevNotesApp.init(menu_factory: menu_factory)
      expect(menu.render).toHaveBeenCalled()

    it 'creates notes index', ->
      setFixtures sandbox()
      DevNotesApp.bodySelector = '#sandbox'

      notes_index = { render: @stub().returns({el: '<div>text</div>'}) }
      notes_index_factory = { create: @stub().withArgs(collection: DevNotesApp.notesCollection).returns(notes_index) }

      DevNotesApp.init(notes_index_factory: notes_index_factory)
      expect($(DevNotesApp.bodySelector)).toHaveText(/text/)

    it 'creates note details container element', ->
      setFixtures sandbox()
      DevNotesApp.bodySelector = '#sandbox'

      new DevNotesApp.Routers.NotesRouter

      DevNotesApp.init()
      expect($(DevNotesApp.bodySelector)).toContain('#note_details')


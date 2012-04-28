describe "Til", ->
  describe "init", ->
    it 'initializes TILs collection', ->
      TilApp.init(tils: [{content: "awesome"}, {content: "blah"}])

      expect(TilApp.tilsCollection).toBeDefined()
      expect(TilApp.tilsCollection.length).toEqual(2)
      expect(TilApp.tilsCollection.models[0].get('content')).toEqual("awesome")
      expect(TilApp.tilsCollection.models[1].get('content')).toEqual("blah")

    it 'creates tils router', ->
      tils_router_factory = { create: @spy() }
      TilApp.init(tils_router_factory: tils_router_factory)
      expect(tils_router_factory.create).toHaveBeenCalled()

    it 'starts backbone history', ->
      history = { start: @spy() }

      TilApp.init(history: history)
      expect(history.start).toHaveBeenCalled()

    it 'creates menu', ->
      menu = { render: @spy() }
      menu_factory = { create: @stub().returns(menu) }

      TilApp.init(menu_factory: menu_factory)
      expect(menu.render).toHaveBeenCalled()

    it 'creates tils index', ->
      setFixtures sandbox()
      TilApp.bodySelector = '#sandbox'

      tils_index = { render: @stub().returns({el: '<div>text</div>'}) }
      tils_index_factory = { create: @stub().withArgs(collection: TilApp.tilsCollection).returns(tils_index) }

      TilApp.init(tils_index_factory: tils_index_factory)
      expect($(TilApp.bodySelector)).toHaveText(/text/)

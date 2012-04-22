describe "Til", ->
  describe "init", ->
    tils_router_factory = null

    beforeEach ->
      tils_router_factory = { create: sinon.spy() }

    it 'initializes TILs collection', ->
      TilApp.init([{content: "awesome"}, {content: "blah"}])

      expect(TilApp.tilsCollection).toBeDefined()
      expect(TilApp.tilsCollection.length).toEqual(2)
      expect(TilApp.tilsCollection.models[0].get('content')).toEqual("awesome")
      expect(TilApp.tilsCollection.models[1].get('content')).toEqual("blah")

    it 'creates tils router', ->
      TilApp.init([], {tils_router_factory: tils_router_factory})
      expect(tils_router_factory.create).toHaveBeenCalled()

    it 'starts backbone history', ->
      history = { start: @spy() }

      TilApp.init([], {tils_router_factory: tils_router_factory, history: history})
      expect(history.start).toHaveBeenCalled()

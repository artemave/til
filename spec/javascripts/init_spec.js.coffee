describe "Til", ->
  describe "init", ->
    it 'initializes TILs collection', ->
      TilApp.init([{content: "awesome"}, {content: "blah"}])

      expect(TilApp.tilsCollection).toBeDefined()
      expect(TilApp.tilsCollection.length).toEqual(2)
      expect(TilApp.tilsCollection.models[0].get('content')).toEqual("awesome")
      expect(TilApp.tilsCollection.models[1].get('content')).toEqual("blah")

    it 'creates tils router', ->
      TilApp.Routers.TilsRouter = this.spy()
      TilApp.init()
      expect(TilApp.Routers.TilsRouter).toHaveBeenCalled()

    it 'starts backbone history', ->
      Backbone.history = { start: this.spy() }
      TilApp.init()
      expect(Backbone.history.start).toHaveBeenCalled()

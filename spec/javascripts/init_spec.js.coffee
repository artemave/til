describe "Til", ->
  describe "init", ->
    it 'initializes TILs collection', ->
      Til.init([{content: "awesome"}, {content: "blah"}])

      expect(Til.tilsCollection).toBeDefined()
      expect(Til.tilsCollection.length).toEqual(2)
      expect(Til.tilsCollection.models[0].get('content')).toEqual("awesome")
      expect(Til.tilsCollection.models[1].get('content')).toEqual("blah")

    it 'creates router', ->
      Til.Routers.TilsRouter = this.spy()
      Til.init()
      expect(Til.Routers.TilsRouter).toHaveBeenCalled()

    it 'starts backbone history', ->
      Backbone.history = { start: this.spy() }
      Til.init()
      expect(Backbone.history.start).toHaveBeenCalled()

describe 'TilApp.Routers.TilsRouter', ->
  describe 'init', ->
    it 'creates menu', ->
      menu = { render: @spy() }
      menu_factory = { create: @stub().returns(menu) }

      new TilApp.Routers.TilsRouter(menu_factory: menu_factory)
      expect(menu.render).toHaveBeenCalled()

    it 'creates tils index', ->
      tils_index = { render: @spy() }
      tils_index_factory = { create: @stub().withArgs(collection: TilApp.tilsCollection).returns(tils_index) }

      new TilApp.Routers.TilsRouter(tils_index_factory: tils_index_factory)
      expect(tils_index.render).toHaveBeenCalled()

  describe '#index', ->
    it 'shows last modified til', ->

  describe '#new', ->

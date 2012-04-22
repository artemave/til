describe 'TilApp.Routers.TilsRouter', ->
  describe 'init', ->
    it 'creates menu', ->
      menu = { render: @spy() }
      menu_factory = { create: @stub().returns(menu) }

      new TilApp.Routers.TilsRouter(menu_factory: menu_factory)
      expect(menu.render).toHaveBeenCalled()

    it 'creates tils index', ->

  describe '#index', ->
    it 'shows last modified til', ->

  describe '#new', ->

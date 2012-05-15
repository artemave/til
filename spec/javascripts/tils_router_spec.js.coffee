describe 'TilApp.Routers.TilsRouter', ->
  it 'roots to redirecting to show last modified til', ->
    navigate = @spy()
    @stub(TilApp.tilsCollection, 'last_modified_til').returns(new TilApp.Models.Til(_id: 1, content: 'sweet'))

    router = new TilApp.Routers.TilsRouter(navigate: navigate)
    router.root()

    expect(navigate).toHaveBeenCalledWith("tils/1", trigger: true)

  describe '#new', ->
    it 'displays new til form', ->
      setFixtures sandbox()
      TilApp.bodySelector = '#sandbox'

      til_form_view = { render: @stub().returns(el: 'form') }
      til_form_view_factory = { create: @stub().returns(til_form_view) }

      spyOnEvent($(til_form_view), 'load_pagedown_editor')

      router = new TilApp.Routers.TilsRouter(til_form_view_factory: til_form_view_factory, el: '#sandbox')
      router.new()

      expect($('#sandbox')).toHaveText(/form/)
      expect('load_pagedown_editor').toHaveBeenTriggeredOn($(til_form_view))

describe 'TilApp.Routers.TilsRouter', ->
  it 'roots to redirecting to show last modified til', ->
    navigate = @spy()
    @stub(TilApp.tilsCollection, 'last_modified_til').returns(new TilApp.Models.Til(_id: 1, content: 'sweet'))

    router = new TilApp.Routers.TilsRouter(navigate: navigate)
    router.root()

    expect(navigate).toHaveBeenCalledWith("tils/1", trigger: true)

  describe '#new', ->

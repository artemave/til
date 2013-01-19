describe 'DevNotesApp.MenuView', ->
  beforeEach ->
    setFixtures sandbox
      id: 'note_button_bar'

    view = new DevNotesApp.Views.Menu()
    @$el = $(view.render().el)

  it "renders new button", ->
    expect(@$el).toContain('a')
    expect(@$el).toHaveText(/New/)

  it 'renders search input', ->
    expect(@$el).toContain('.search-query')

  it 'search triggers "search" event', ->
    search_string = ''
    DevNotesApp.Notifications.on 'search', (query) ->
      search_string = query

    @$el.find('input.search-query').val('ab').trigger('input')

    waitsFor ->
      search_string == 'ab'
    , 'search to be triggered', 500

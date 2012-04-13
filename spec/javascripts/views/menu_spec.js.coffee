describe 'TilApp.MenuView', ->
  beforeEach ->
    setFixtures sandbox
      id: 'til_button_bar'

  it "renders new button", ->
    view = new TilApp.Views.Menu()
    $el = $(view.render().el)

    expect($el).toContain('a')
    expect($el).toHaveText(/New/)

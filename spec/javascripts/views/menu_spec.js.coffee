describe 'DevNotesApp.MenuView', ->
  beforeEach ->
    setFixtures sandbox
      id: 'note_button_bar'

  it "renders new button", ->
    view = new DevNotesApp.Views.Menu()
    $el = $(view.render().el)

    expect($el).toContain('a')
    expect($el).toHaveText(/New/)

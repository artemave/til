describe "DevNotesApp.Views.NotesIndex", ->

  it "creates notes table", ->
    view = new DevNotesApp.Views.NotesIndex()
    $el = $(view.render().el)

    expect($el).toBe("#notes.span4")
    expect($el).toContain('table')

  it "shows notes in notes table", ->
    notes = new DevNotesApp.Collections.NotesCollection [
      { content: 'sparrow is an excellent email client with seamless gmail support' },
      { content: 'alfred is a nice spotlite alternative' }
    ]
    view = new DevNotesApp.Views.NotesIndex(collection: notes)
    $el = $(view.render().el)

    expect($el).toHaveText(/sparrow is an excellent email client with seamless gmail support/)
    expect($el).toHaveText(/alfred is a nice spotlite alternative/)


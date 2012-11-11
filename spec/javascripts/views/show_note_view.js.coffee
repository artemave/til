describe "DevNotesApp.Views.ShowNote", ->
  it "show html content of a note", ->
    markdown = "This is markdown\n====="
    html = '<h1>This is makrdown</h1>'
    note = new DevNotesApp.Models.Note(content: markdown)

    view = new DevNotesApp.Views.ShowNote(note: note)
    $el = view.render().$el

    expect($el.find('h1')).toHaveText("This is markdown")

  it 'can be switched to edit mode', ->
    navigate = @spy()
    note = new DevNotesApp.Models.Note(content: 'content', id: 1)
    view = new DevNotesApp.Views.ShowNote(note: note, navigate: navigate)

    $el = $(view.render().el)
    button = $el.find("button:contains('Edit')")
    button.click()

    expect(navigate).toHaveBeenCalledWith("notes/1/edit", trigger: true)

  it 'allows to delete note', ->
    navigate = @spy()
    @stub(window, 'confirm').returns(true)

    note = new DevNotesApp.Models.Note(content: 'content', id: 1)
    view = new DevNotesApp.Views.ShowNote(note: note, navigate: navigate)

    $el = $(view.render().el)
    button = $el.find("button:contains('Delete')")
    button.click()

    expect(window.confirm).toHaveBeenCalledWith("Really?")
    expect(navigate).toHaveBeenCalledWith("notes/1/delete", trigger: true)

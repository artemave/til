describe "DevNotesApp.Views.ShowNote", ->
  it "show markdown content of a note", ->
    content = 'This is content'
    markdown = 'This is makrdown'
    note = new DevNotesApp.Models.Note(content: content)

    converter = makeHtml: @stub()
    converter.makeHtml.withArgs(content).returns(markdown)

    view = new DevNotesApp.Views.ShowNote(note: note, converter: converter)
    $el = view.render().$el

    expect($el).toHaveText(new RegExp(markdown))

  it 'can be switched to edit mode', ->
    navigate = @spy()
    note = new DevNotesApp.Models.Note(content: 'content', _id: 1)
    view = new DevNotesApp.Views.ShowNote(note: note, navigate: navigate)

    $el = $(view.render().el)
    button = $el.find("button:contains('Edit')")
    button.click()

    expect(navigate).toHaveBeenCalledWith("notes/1/edit", trigger: true)

  it 'allows to delete note', ->
    navigate = @spy()
    @stub(window, 'confirm').returns(true)

    note = new DevNotesApp.Models.Note(content: 'content', _id: 1)
    view = new DevNotesApp.Views.ShowNote(note: note, navigate: navigate)

    $el = $(view.render().el)
    button = $el.find("button:contains('Delete')")
    button.click()

    expect(window.confirm).toHaveBeenCalledWith("Really?")
    expect(navigate).toHaveBeenCalledWith("notes/1/delete", trigger: true)

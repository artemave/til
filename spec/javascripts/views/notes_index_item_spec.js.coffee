describe 'DevNotesApp.Views.NotesIndexItem', ->
  it 'renders Note model in table row', ->
    content = "it is snowing #{Math.random()}"
    note = new DevNotesApp.Models.Note(content: content, id: 5)
    view = new DevNotesApp.Views.NotesIndexItem(model: note)
    $el = $(view.render().el)

    expect($el).toBe('tr')
    expect($el).toContain('td')
    expect($el).toHaveText(new RegExp(content))

  it 'shows note when clicked', ->
    navigate = @spy()
    note = new DevNotesApp.Models.Note(content: 'content', id: 5)
    view = new DevNotesApp.Views.NotesIndexItem(model: note, navigate: navigate)
    $el = $(view.render().el)
    $el.click()

    expect(navigate).toHaveBeenCalledWith("notes/5", trigger: true)

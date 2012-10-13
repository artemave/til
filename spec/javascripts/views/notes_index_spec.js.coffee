describe "DevNotesApp.Views.NotesIndex", ->
  beforeEach ->
    @notes = new DevNotesApp.Collections.NotesCollection [
      { id: 1, content: 'sparrow is an excellent email client with seamless gmail support' },
      { id: 2, content: 'alfred is a nice spotlite alternative' }
    ]
    @view = new DevNotesApp.Views.NotesIndex(collection: @notes)
    @$el = $(@view.render().el)

  it "creates notes table", ->
    expect(@$el).toBe("#notes.span4")
    expect(@$el).toContain('table')

  it "shows notes in notes table", ->
    expect(@$el).toHaveText(/sparrow is an excellent email client with seamless gmail support/)
    expect(@$el).toHaveText(/alfred is a nice spotlite alternative/)

  describe 'automatically rerenders', ->
    it 'on create', ->
      @$el = $(@view.el)

      @notes.add content: 'next time I will try bourbon neat instead of twitter bootstrap'
      expect(@$el).toHaveText(/next time I will try bourbon neat instead of twitter bootstrap/)

    it 'on edit', ->
      @$el = $(@view.el)

      note = @notes.get(1)
      note.set('content', 'now I think the opposite')
      note.save()

      expect(@$el).not.toHaveText(/sparrow is an excellent/)
      expect(@$el).toHaveText(/now I think the opposite/)

    it 'on destroy', ->
      @$el = $(@view.el)

      @notes.first().destroy()
      expect(@$el).not.toHaveText(/sparrow is an excellent/)

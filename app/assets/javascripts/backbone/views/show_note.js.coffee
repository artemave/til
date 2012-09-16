class DevNotesApp.Views.ShowNote extends Support.CompositeView
  @Factory: ->
    create: (note) ->
      new ShowNote(note: note)

  className: 'span8'

  events:
    "click button.edit": 'redirect_to_edit_note'
    "click button.delete": 'redirect_to_delete_note'

  initialize: (opts) ->
    @note      = opts.note
    @navigate  = opts.navigate || DevNotesApp.navigate
    @convertor = opts.converter || new Markdown.Converter()

  render: ->
    if @note
      content = @convertor.makeHtml(@note.get('content'))
      @$el.html(JST['notes/show'](content: content))
    this

  redirect_to_edit_note: ->
    @navigate("notes/#{@note.id}/edit", trigger: true)

  redirect_to_delete_note: ->
    if window.confirm "Really?"
      @navigate("notes/#{@note.id}/delete", trigger: true)

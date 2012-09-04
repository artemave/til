class DevNotesApp.Views.ShowNote extends Support.CompositeView
  className: 'span8'

  events:
    "click button": 'redirect_to_edit_note'

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

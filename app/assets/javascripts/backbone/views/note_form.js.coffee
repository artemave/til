class DevNotesApp.Views.NoteForm extends Support.CompositeView
  @Factory: ->
    create: (opts = {}) ->
      new NoteForm(opts)

    createEdit: (note, opts = {}) ->
      opts.note = note
      new NoteForm(opts)

  className: 'span8'

  events:
    "load_pagedown_editor": "load_pagedown_editor"
    "click button": "save"

  initialize: (opts = {}) ->
    @notes_collection = opts.notes_collection || DevNotesApp.notesCollection
    @note = opts.note || new DevNotesApp.Models.Note

  render: ->
    @$el.html(JST['notes/form'](note: @note))
    this

  save: ->
    new_content = @$('textarea').val()
    existing_note = @notes_collection.get(@note.id)

    if existing_note?
      @note.set 'content', new_content
      @note.save()
    else
      @notes_collection.create
        content: new_content

    false

  load_pagedown_editor: ->
    if @$el.is(':visible')
      convertor = Markdown.getSanitizingConverter()
      editor = new Markdown.Editor(convertor)
      editor.run()


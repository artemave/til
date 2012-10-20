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
    @navigate = opts.navigate || DevNotesApp.navigate
    @

  render: ->
    @$el.html(JST['notes/form'](note: @note))
    @

  save: ->
    new_content = @$('textarea').val()

    if @note.isNew()
      @notes_collection.create { content: new_content }, wait: true, success: (new_model) =>
        @navigate "notes/#{new_model.id}/edit", trigger: true
    else
      @note.set 'content', new_content
      @note.save()

    false

  load_pagedown_editor: ->
    if @$el.is(':visible')
      convertor = Markdown.getSanitizingConverter()
      Markdown.highlightSyntax(convertor)
      editor = new Markdown.Editor(convertor)

      editor.hooks.set "onPreviewRefresh", ->
        prettyPrint()

      editor.run()


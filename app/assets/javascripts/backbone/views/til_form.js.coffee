class TilApp.Views.TilForm extends Support.CompositeView
  @Factory: ->
    create: (opts = {}) ->
      new TilForm(opts)

    createEdit: (til, opts = {}) ->
      opts.til = til
      new TilForm(opts)

  className: 'span8'

  events:
    "load_pagedown_editor": "load_pagedown_editor"
    "click button": "save"

  initialize: (opts = {}) ->
    @tils_collection = opts.tils_collection || TilApp.tilsCollection
    @til = opts.til || new TilApp.Models.Til

  render: ->
    @$el.html(JST['tils/form'](til: @til))
    this

  save: ->
    new_content = @$('textarea').val()
    existing_til = @tils_collection.get(@til.id)

    if existing_til?
      @til.set 'content', new_content
      @til.save()
    else
      @tils_collection.create
        content: new_content

    false

  load_pagedown_editor: ->
    if @$el.is(':visible')
      convertor = Markdown.getSanitizingConverter()
      editor = new Markdown.Editor(convertor)
      editor.run()


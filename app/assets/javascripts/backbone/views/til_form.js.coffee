class TilApp.Views.TilForm extends Support.CompositeView
  @Factory: ->
    create: ->
      new TilForm

    createEdit: (til) ->
      new TilForm(til: til)

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
    @tils_collection.create
      content: @$('textarea').val()
    false

  load_pagedown_editor: ->
    if @$el.is(':visible')
      convertor = Markdown.getSanitizingConverter()
      editor = new Markdown.Editor(convertor)
      editor.run()


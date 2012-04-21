class TilApp.Views.ShowTil extends Support.CompositeView
  className: 'span8'

  initialize: (opts) ->
    @til = opts.til
    @convertor = opts.converter or new Markdown.Converter()

  render: ->
    @$el.html(@convertor.makeHtml(@til.get('content')))
    @

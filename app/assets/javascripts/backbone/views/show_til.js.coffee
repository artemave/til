class TilApp.Views.ShowTil extends Support.CompositeView
  className: 'span8'

  events:
    "click button": 'redirect_to_edit_til'

  initialize: (opts) ->
    @til       = opts.til
    @navigate  = opts.navigate || TilApp.navigate
    @convertor = opts.converter || new Markdown.Converter()

  render: ->
    if @til
      content = @convertor.makeHtml(@til.get('content'))
      @$el.html(JST['tils/show'](content: content))
    this

  redirect_to_edit_til: ->
    @navigate("tils/#{@til.id}/edit", trigger: true)

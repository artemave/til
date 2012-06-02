class TilApp.Views.TilsIndex extends Support.CompositeView
  id: 'tils'
  className: 'span4'

  initialize: (opts = {})->
    @collection = opts.collection || new TilApp.Collections.TilsCollection()
    _.bindAll(this, 'render')
    @collection.bind('add', @render)
    @collection.bind('change', @render)

  render: ->
    @renderTemplate()
    if @collection.length > 0
      @renderTils()
    this

  renderTemplate: ->
    $(@el).html(JST['tils/index']())

  renderTils: ->
    @collection.each (til) =>
      row = new TilApp.Views.TilsIndexItem(model: til)
      @renderChild(row)
      @$('tbody').prepend(row.el)

  @Factory: ->
    create: (opts = {}) ->
      new TilsIndex(opts)

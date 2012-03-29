class TilApp.Views.TilsIndex extends Support.CompositeView
  id: 'tils'
  className: 'span3'

  initialize: (opts = {})->
    @collection = opts.collection || new TilApp.Collections.TilsCollection()
    _.bindAll(this, 'render')
    @collection.bind('add', @render)

  render: ->
    @renderTemplate()
    @renderNewTilForm()
    if @collection.length > 0
      @renderTils()

    this

  renderTemplate: ->
    $(@el).html(JST['tils/index']())

  renderNewTilForm: ->
    new_til_form = new TilApp.Views.TilForm()
    @renderChild(new_til_form)
    $(@el).prepend(new_til_form.el)

  renderTils: ->
    @collection.each (til) =>
      row = new TilApp.Views.TilsIndexItem(model: til)
      @renderChild(row)
      @$('tbody').append(row.el)

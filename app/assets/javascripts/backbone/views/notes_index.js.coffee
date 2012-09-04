class DevNotesApp.Views.NotesIndex extends Support.CompositeView
  id: 'notes'
  className: 'span4'

  initialize: (opts = {})->
    @collection = opts.collection || new DevNotesApp.Collections.NotesCollection()
    _.bindAll(this, 'render')
    @collection.bind('add', @render)
    @collection.bind('change', @render)

  render: ->
    @renderTemplate()
    if @collection.length > 0
      @renderNotes()
    this

  renderTemplate: ->
    $(@el).html(JST['notes/index']())

  renderNotes: ->
    @collection.each (note) =>
      row = new DevNotesApp.Views.NotesIndexItem(model: note)
      @renderChild(row)
      @$('tbody').prepend(row.el)

  @Factory: ->
    create: (opts = {}) ->
      new NotesIndex(opts)

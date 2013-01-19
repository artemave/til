class DevNotesApp.Views.NotesIndex extends Support.CompositeView
  id: 'notes'
  className: 'span4'

  initialize: (opts = {})->
    @collection = opts.collection || new DevNotesApp.Collections.NotesCollection()
    _.bindAll(@, 'render', 'renderFiltered')

    @collection.bind('add', @render)
    @collection.bind('change', @render)
    @collection.bind('remove', @render)
    DevNotesApp.Notifications.on('search', @renderFiltered)

  render: ->
    @renderTemplate()

    result_array = @collection.search(@current_search_term || '')
    filteredCollection = new DevNotesApp.Collections.NotesCollection(result_array)

    if filteredCollection.length > 0
      @renderNotes(filteredCollection)

      _.defer ->
        $('.dotdotdot').dotdotdot()
      DevNotesApp.Notifications.trigger 'select_row'
    @

  renderFiltered: (search_term) ->
    @current_search_term = search_term
    @render()

  renderTemplate: ->
    $(@el).html(JST['notes/index']())

  renderNotes: (collection) ->
    collection.each (note) =>
      row = new DevNotesApp.Views.NotesIndexItem(model: note)
      @renderChild(row)
      @$('tbody').prepend(row.el)

  @Factory: ->
    create: (opts = {}) ->
      new NotesIndex(opts)

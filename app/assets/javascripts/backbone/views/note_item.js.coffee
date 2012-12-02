class DevNotesApp.Views.NotesIndexItem extends Support.CompositeView
  tagName: 'tr'

  events:
    'click': 'redirect_to_show_note'

  initialize: (opts = {}) ->
    @model = opts.model
    @navigate = opts.navigate || DevNotesApp.navigate
    _.bindAll(@, 'select_row')
    DevNotesApp.Notifications.on 'select_row', @select_row

  render: ->
    $(@el).html(JST['notes/item'](model: @model))
    @

  redirect_to_show_note: ->
    @navigate("notes/#{@model.id}", trigger: true)
    DevNotesApp.Notifications.trigger 'select_row', @model.id

  select_row: (note_id) ->
    DevNotesApp.currentSelectedNote = note_id if note_id?

    if @model.id is DevNotesApp.currentSelectedNote
      $(@el).addClass 'selected'
    else
      $(@el).removeClass 'selected'

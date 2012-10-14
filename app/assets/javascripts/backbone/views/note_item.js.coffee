class DevNotesApp.Views.NotesIndexItem extends Support.CompositeView
  tagName: 'tr'

  events:
    'click': 'redirect_to_show_note'

  initialize: (opts = {}) ->
    @model = opts.model
    @navigate = opts.navigate || DevNotesApp.navigate

  render: ->
    $(@el).html(JST['notes/item'](model: @model))
    this

  redirect_to_show_note: ->
    @navigate("notes/#{@model.id}", trigger: true)

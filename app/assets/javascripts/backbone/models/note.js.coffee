class DevNotesApp.Models.Note extends Backbone.Model
  paramRoot: 'note'
  idAttribute: "_id"


class DevNotesApp.Collections.NotesCollection extends Backbone.Collection
  model: DevNotesApp.Models.Note

  url: '/notes'

  comparator: (note) ->
    Date.parse note.get('updated_at')

  last_modified_note: ->
    @last()

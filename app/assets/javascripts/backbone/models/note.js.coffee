class DevNotesApp.Models.Note extends Backbone.Model
  paramRoot: 'note'

class DevNotesApp.Collections.NotesCollection extends Backbone.Collection
  model: DevNotesApp.Models.Note

  url: '/notes'

  comparator: (note) ->
    Date.parse note.get('updated_at')

  last_modified_note: ->
    @last()

  search: (search_term) ->
    @filter (note) ->
      note.get('content').match new RegExp(search_term)

class TilApp.Models.Til extends Backbone.Model
  paramRoot: 'til'
  idAttribute: "_id"


class TilApp.Collections.TilsCollection extends Backbone.Collection
  model: TilApp.Models.Til

  url: '/tils'

  comparator: (til) ->
    Date.parse til.get('updated_at')

  last_modified_til: ->
    @last()

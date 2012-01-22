class Til.Models.Til extends Backbone.Model
  paramRoot: 'til'

class Til.Collections.TilsCollection extends Backbone.Collection
  model: Til.Models.Til
  url: '/tils'

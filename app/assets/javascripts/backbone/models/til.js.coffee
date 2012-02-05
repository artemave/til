class TilApp.Models.Til extends Backbone.Model
  paramRoot: 'til'


class TilApp.Collections.TilsCollection extends Backbone.Collection
  model: TilApp.Models.Til
  url: '/tils'

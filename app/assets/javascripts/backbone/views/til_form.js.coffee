class TilApp.Views.TilForm extends Support.CompositeView
  render: ->
    $(@el).html(JST['tils/form']())
    this

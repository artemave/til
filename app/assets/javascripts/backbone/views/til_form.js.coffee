class TilApp.Views.TilForm extends Support.CompositeView
  render: ->
    form = new Backbone.Form
      schema:
        content:
          type: 'TextArea'
          title: 'Today I learned that'

    $(@el)
      .html(form.render().el)
      .append($('<input>', type: 'submit', value: 'Save'))

    @$('input[type="submit"]').bind 'click', ->
      TilApp.tilsCollection.add form.getValue()

    this

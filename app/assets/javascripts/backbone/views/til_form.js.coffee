class TilApp.Views.TilForm extends Support.CompositeView
  render: ->
    form = new Backbone.Form
      schema:
        content:
          type: 'TextArea'
          title: 'Today I learned that'

    $(@el)
      .html(form.render().el)
      .find('form')
      .append($('<button>', class: 'btn', type: 'submit', text: 'Save'))

    @$('button[type="submit"]').bind 'click', ->
      TilApp.tilsCollection.create form.getValue()
      false

    this

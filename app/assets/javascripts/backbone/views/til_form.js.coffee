class TilApp.Views.TilForm extends Support.CompositeView
  render: ->
    form = new Backbone.Form
      schema:
        content:
          template: 'pagedown'

    $(@el)
      .html(form.render().el)
      .find('form')
      .append($('<button>', class: 'btn btn-primary', type: 'submit', text: 'Save'))

    @$('button[type="submit"]').bind 'click', ->
      TilApp.tilsCollection.create form.getValue()
      false

    this

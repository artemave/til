class TilApp.Views.TilForm extends Support.CompositeView
  className: 'span9'

  render: ->
    @$el.html(JST['tils/form']())

    @$('button[type="submit"]').bind 'click', =>
      TilApp.tilsCollection.create
        content: @$('textarea').val()

      false

    $(document).on 'load_pagedown_editor', =>
      if @$el.is(':visible')
        convertor = Markdown.getSanitizingConverter()
        editor = new Markdown.Editor(convertor)
        editor.run()


    this


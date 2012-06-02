describe 'TilApp.Views.TilForm', ->
  describe 'New til', ->
    it 'shows editor form', ->
      new_til = new TilApp.Views.TilForm()
      $el = $(new_til.render().el)

      expect($el).toContain('textarea')
      expect($el.find('button[type="submit"]')).toHaveText(/Save/)

    it 'creates new til', ->
      tils_collection = create: @spy()
      til_form = new TilApp.Views.TilForm(tils_collection: tils_collection)
      $el = $(til_form.render().el)
      $el.find('textarea').val('content')
      $el.find('button:contains("Save")').click()

      expect(tils_collection.create).toHaveBeenCalledWith(content: 'content')

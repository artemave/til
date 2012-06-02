describe 'TilApp.Views.TilForm', ->
  describe 'New til', ->
    it 'shows blank editor form', ->
      new_til = new TilApp.Views.TilForm()
      $el = $(new_til.render().el)

      expect($el).toContain('textarea')
      expect($el.find('button[type="submit"]')).toHaveText(/Save/)

    it 'creates new til', ->
      tils_collection = create: @spy(), get: ->
      til_form = new TilApp.Views.TilForm(tils_collection: tils_collection)
      $el = $(til_form.render().el)
      $el.find('textarea').val('content')
      $el.find('button:contains("Save")').click()

      expect(tils_collection.create).toHaveBeenCalledWith(content: 'content')

  describe 'Edit til', ->
    it 'shows editor form with contents of edited til', ->
      form_factory = new TilApp.Views.TilForm.Factory
      til_form = form_factory.createEdit(new TilApp.Models.Til(content: 'til content'))
      $el = $(til_form.render().el)
      expect($el.find('textarea')).toHaveText(/til content/)

    it 'saves changes to existing til', ->
      til = new TilApp.Models.Til(content: 'til content')
      tils_collection = get: @stub().withArgs(til.id).returns(til)

      form_factory = new TilApp.Views.TilForm.Factory()
      til_form = form_factory.createEdit(til, tils_collection: tils_collection)

      $el = $(til_form.render().el)
      $el.find('textarea').val('new content')
      $el.find('button:contains("Save")').click()

      expect(til.get('content')).toEqual('new content')

describe "TilApp.Views.TilsIndex", ->

  it "creates tils table", ->
    view = new TilApp.Views.TilsIndex()
    $el = $(view.render().el)

    expect($el).toBe("#tils")
    expect($el).toContain('table')

  it "shows tils in tils table", ->
    tils = new TilApp.Collections.TilsCollection [
      { content: 'sparrow is an excellent email client with seamless gmail support' },
      { content: 'alfred is a nice spotlite alternative' }
    ]
    view = new TilApp.Views.TilsIndex(collection: tils)
    $el = $(view.render().el)

    expect($el).toHaveText(/sparrow is an excellent email client with seamless gmail support/)
    expect($el).toHaveText(/alfred is a nice spotlite alternative/)

  it 'shows new til form', ->
    new_til_view = new TilApp.Views.TilForm()
    $new_til = $(new_til_view.render().el)

    view = new TilApp.Views.TilsIndex()
    $el = $(view.render().el)

    # I'd ideally use toHaveHtml from jasmine-jqeury. If only it worked
    expect($el.html()).toMatch($new_til.html())

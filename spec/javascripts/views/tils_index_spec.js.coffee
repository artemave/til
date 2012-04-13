describe "TilApp.Views.TilsIndex", ->

  it "creates tils table", ->
    view = new TilApp.Views.TilsIndex()
    $el = $(view.render().el)

    expect($el).toBe("#tils.span4")
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


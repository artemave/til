describe "TilApp.Views.TilsIndex", ->
  beforeEach ->
    $('#main').html('')

  it "creates tils table", ->
    view = new TilApp.Views.TilsIndex()
    view.render()
    $el = $(view.el)

    expect($el).toBe("#tils")
    expect($el).toContain('table')

  it "shows tils in tils table", ->
    tils = new TilApp.Collections.TilsCollection [
      { content: 'sparrow is an excellent email client with seamless gmail support' },
      { content: 'alfred is a nice spotlite alternative' }
    ]
    view = new TilApp.Views.TilsIndex(collection: tils)
    view.render()
    $el = $(view.el)

    expect($el).toHaveText(/sparrow is an excellent email client with seamless gmail support/)
    expect($el).toHaveText(/alfred is a nice spotlite alternative/)

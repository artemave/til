describe "TilApp.Views.TilsIndex", ->
  it "creates tils table", ->
    view = new TilApp.Views.TilsIndex()
    view.render()
    $el = $(view.el)

    expect($el).toBe("#tils")
    expect($el).toContain('table')

describe "TilApp.Views.ShowTil", ->

  it "show markdown content of a til", ->
    content = 'This is content'
    markdown = 'This is makrdown'
    til = new TilApp.Models.Til(content: content)

    converter = makeHtml: @stub()
    converter.makeHtml.withArgs(content).returns(markdown)

    view = new TilApp.Views.ShowTil(til: til, converter: converter)
    $el = view.render().$el

    expect($el).toHaveText(markdown)

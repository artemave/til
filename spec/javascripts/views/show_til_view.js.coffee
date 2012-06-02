describe "TilApp.Views.ShowTil", ->

  it "show markdown content of a til", ->
    content = 'This is content'
    markdown = 'This is makrdown'
    til = new TilApp.Models.Til(content: content)

    converter = makeHtml: @stub()
    converter.makeHtml.withArgs(content).returns(markdown)

    view = new TilApp.Views.ShowTil(til: til, converter: converter)
    $el = view.render().$el

    expect($el).toHaveText(new RegExp(markdown))

  it 'can be switched to edit mode', ->
    navigate = @spy()
    til = new TilApp.Models.Til(content: 'content', _id: 1)
    view = new TilApp.Views.ShowTil(til: til, navigate: navigate)

    $el = $(view.render().el)
    button = $el.find("button:contains('Edit')")
    button.click()

    expect(navigate).toHaveBeenCalledWith("tils/1/edit", trigger: true)

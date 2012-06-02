describe 'TilApp.Views.TilsIndexItem', ->
  it 'renders Til model in table row', ->
    content = "it is snowing #{Math.random()}"
    til = new TilApp.Models.Til(content: content, _id: 5)
    view = new TilApp.Views.TilsIndexItem(model: til)
    $el = $(view.render().el)

    expect($el).toBe('tr')
    expect($el).toContain('td')
    expect($el).toHaveText(new RegExp(content))

  it 'shows til when clicked', ->
    navigate = @spy()
    til = new TilApp.Models.Til(content: 'content', _id: 5)
    view = new TilApp.Views.TilsIndexItem(model: til, navigate: navigate)
    $el = $(view.render().el)
    $el.click()

    expect(navigate).toHaveBeenCalledWith("tils/5", trigger: true)

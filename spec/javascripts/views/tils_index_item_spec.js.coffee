describe 'TilApp.Views.TilsIndexItem', ->
  it 'renders Til model in table row', ->
    content = "it is snowing #{Math.random()}"
    til = new TilApp.Models.Til(content: content, id: 5)
    view = new TilApp.Views.TilsIndexItem(model: til)
    $el = $(view.render().el)

    expect($el).toBe('tr')
    expect($el).toContain('td')
    expect($el).toHaveText(new RegExp(content))

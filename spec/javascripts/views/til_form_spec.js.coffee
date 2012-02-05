describe 'TilApp.Views.TilForm', ->
  it 'shows form for submitting new til', ->
    new_til = new TilApp.Views.TilForm()
    $el = $(new_til.render().el)

    expect($el).toHaveText(/Today I learned that/)
    expect($el).toContain('textarea')
    expect($el).toContain("input[type='submit'][value='stash']")

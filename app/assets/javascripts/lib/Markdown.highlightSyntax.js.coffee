Markdown.highlightSyntax = (converter) ->
  converter.hooks.set 'postConversion', (html) ->
    $html = $(html)
    $html.find('code').parent('pre').addClass 'prettyprint'
    $('<div>').append($html).html()

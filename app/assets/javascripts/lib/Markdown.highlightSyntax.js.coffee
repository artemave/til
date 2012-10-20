Markdown.highlightSyntax = (converter) ->
  converter.hooks.set 'postConversion', (html) ->
    $html = $(html)
    $html.find('code').parent('pre').addClass 'prettyprint'
    $('<div>').append($html).html()

Markdown.hookHighlightIntoEditor = (editor) ->
  editor.hooks.set "onPreviewRefresh", ->
    prettyPrint()


describe "Markdown.highlightSyntax()", ->
  describe 'no specifc language enforced', ->
    it 'hooks into convertor postConversion to prettify every code block', ->
      converter = Markdown.getSanitizingConverter()

      Markdown.highlightSyntax(converter)

      source = """
      I am better off to bed

          def sleep
            puts 'zzz...'
          end
      """

      $res = $('<div>').append $(converter.makeHtml(source))

      expect($res.find('pre.prettyprint')).toHaveText(/def sleep/)

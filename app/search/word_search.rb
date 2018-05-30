class WordSearch
  def initialize(word_input)
    @word_input = word_input
  end

  def word
    if oxford_service.status == 200
      word_info = oxford_service.word_info
      Word.new(return_word(word_info[:results][0]), return_inflection(word_info[:results][0]))
    else
      Word.new(word_input, nil)
    end
  end


  private
    attr_reader :word_input

    def return_word(result)
      result[:id]
    end

    def return_inflection(result)
      result[:lexicalEntries][0][:inflectionOf][0][:id]
    end

    def oxford_service
      @oxford_service ||= OxfordService.new(word_input)
    end
end

class WordSearch
  def initialize(word_input)
    @word_input = word_input
  end

  def word
    if response.status == 200
      word_info = JSON.parse(response.body, symbolize_names: true)
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

    def connection
      Faraday.new "https://od-api.oxforddictionaries.com/api/v1/inflections/en/#{word_input}"
    end

    def response
      connection.get do | req |
        req.headers["app_id"]  = ENV["app_id"]
        req.headers["app_key"] = ENV["app_key"]
      end
    end
end

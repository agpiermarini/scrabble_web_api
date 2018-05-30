class WordSearch
  def initialize(word_input)
    @word_input = word_input
  end

  def word
    connection = Faraday.new "https://od-api.oxforddictionaries.com/api/v1/inflections/en/#{word_input}"

    response = connection.get do | req |
      req.headers["app_id"]  = ENV["app_id"]
      req.headers["app_key"] = ENV["app_key"]
    end

    word_info = JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :word_input
end
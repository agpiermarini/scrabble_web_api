class OxfordService
  def initialize(word_input)
    @word_input = word_input
  end

  def status
    response.status
  end

  def word_info
    JSON.parse(response.body, symbolize_names: true) if status == 200
  end

  private
    attr_reader :word_input

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

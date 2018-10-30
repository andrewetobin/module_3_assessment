class SearchFacade
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def examples
    conn = Faraday.new(url: "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.headers["app_id"] = ENV['app_id']
      faraday.headers["app_key"] = ENV['app_key']
      faraday.adapter  Faraday.default_adapter
    end

    conn.get("api/v1/entries/en/#{@word}/sentences")

    response = JSON.parse(response.body, symbolize_names: true)
require "pry"; binding.pry
  end
end

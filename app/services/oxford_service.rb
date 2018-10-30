class OxfordService

  def initialize(word)
    @word = word
  end

  def sentences
    JSON.parse(response.body, symbolize_names: true)[:results][0][:lexicalEntries][0][:sentences]
  end

  def response
    conn.get("api/v1/entries/en/#{@word}/sentences")
  end

  def conn
    Faraday.new(url: "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.headers["app_id"] = ENV['app_id']
      faraday.headers["app_key"] = ENV['app_key']
      faraday.adapter  Faraday.default_adapter
    end
  end

end

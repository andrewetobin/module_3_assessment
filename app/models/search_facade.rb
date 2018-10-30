class SearchFacade
  attr_reader :word, :examples

  def initialize(word)
    @word = word
    @examples = []
  end

  def examples
    results.each do |result|
      @examples << Example.new((result[:text]), (result[:regions].first)) if result[:regions].include?("British") || result[:regions].include?("Canadian")
    end
    @examples
  end

  def results
    service.sentences
  end



  def service
    OxfordService.new(@word)
  end
end

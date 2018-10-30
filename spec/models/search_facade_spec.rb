require 'rails_helper'

describe SearchFacade, type: :model do
  it 'exists' do
    search_facade = SearchFacade.new("saxophone")

    expect(search_facade).to be_a(SearchFacade)
  end

  describe 'instance methods' do
    it 'examples' do
      VCR.use_cassette("instance method word") do
        search_facade = SearchFacade.new("saxophone")

        expect(search_facade.examples).to be_a(Array)
      end
    end
  end
end

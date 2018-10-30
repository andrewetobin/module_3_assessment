require 'rails_helper'

describe "oxford services" do
  it "exists" do
    oxford_service = OxfordService.new("saxophone")

    expect(oxford_service).to be_a(OxfordService)
  end
  it "can get word info" do
    VCR.use_cassette("oxford service word_info") do

      oxford_service = OxfordService.new("saxophone")
      examples = oxford_service.sentences
      expect(examples).to be_a(Array)
      expect(examples.first).to have_key(:regions)
      expect(examples.first).to have_key(:senseIds)
      expect(examples.first).to have_key(:text)

      expect(examples.fifth[:text]).to eq("The instrumentation of the military band is similar to that of the symphony orchestra, minus the strings, but with the addition of cornets and saxophones, and a multiplicity of flutes and clarinets of various sizes.")
      expect(examples.fifth[:regions].first).to eq("British")
    end
  end
end

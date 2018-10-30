require 'rails_helper'


describe "user sees word examples" do
  it "show word used in sentences" do
    visit '/'

    fill_in "q", with: "mindfulness"
    VCR.use_cassette("user looks for examples") do
      click_on "Submit"
    end

    expect(page).to have_content("Examples for using 'mindfulness'")
    expect(page).to have_content("Meditation is one way to express mindfulness in a dedicated, concentrated manner.")
    expect(page).to have_content("At such times, mindfulness of the practice of patience and the application of certain techniques will help us to continue generating this attitude.")
    expect(page).to have_content("All this in a plant with no eyes or imaging organs anybody knows about, no brain or nervous system to support mindfulness.")
  end
end

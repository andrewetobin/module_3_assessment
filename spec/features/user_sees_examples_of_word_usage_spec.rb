require 'rails_helper'


describe "user sees word examples" do
  it "show word used in sentences" do
    # As a guest user (no sign in required)
    # When I visit "/"
    visit '/'
    # And I fill in a text box with "mindfulness"
    fill_in "q", with: "mindfulness"
    # And I click "Submit"
    VCR.use_cassette("user looks for examples") do
      click_on "Submit"
    end
    # Then I should see a message that says "Examples for using 'mindfulness'"
    expect(page).to have_content("Examples for using 'mindfulness'")
    save_and_open_page
    expect(page).to have_css("example")


  end
end

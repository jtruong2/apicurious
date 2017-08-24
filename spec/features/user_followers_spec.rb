require 'rails_helper'
RSpec.describe "User visits activity page" do
  it "sees activities of people I follow" do
    stub_omniauth

    visit root_path
    click_on "Sign in with Github"
    click_on "View recent activity"

    VCR.use_cassette("features/user_sees_following_activity") do

      expect(page).to have_content("ForkEvent")
      expect(page).to have_content("erose357")
      expect(page).to have_content("little_shop")
    end
  end
end

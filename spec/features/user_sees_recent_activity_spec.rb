require 'rails_helper'
RSpec.describe "User visits dashboard" do
  it "sees recent commits from user" do
    stub_omniauth

    visit root_path
    click_on "Sign in with Github"

    VCR.use_cassette("features/user_sees_commits") do
      click_on "View recent activity"

      expect(page).to have_content("apicurious")
      expect(page).to have_content("starts test for user sees repos")
    end
  end
end

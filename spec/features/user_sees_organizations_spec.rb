require 'rails_helper'
RSpec.describe "User visits dashboard" do
  it "sees a list of affiliated organizations" do
    stub_omniauth

    visit root_path
    click_on "Sign in with Github"
    VCR.use_cassette("features/user_sees_org") do
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("1705-BE")
    end
  end
end

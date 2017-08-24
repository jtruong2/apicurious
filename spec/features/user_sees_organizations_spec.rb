require 'rails_helper'
RSpec.describe "User visits dashboard" do
  it "sees a list of affiliated organizations" do
    stub_omniauth

    visit root_path
    click_on "Sign in with Github"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Organizations")
    expect(page).to have_content("1705-BE")
  end
end

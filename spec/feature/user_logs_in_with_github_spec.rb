require 'rails_helper'

RSpec.describe "User logs in", :type => :feature do
  it "using github oauth" do
    stub_omniauth

    visit root_path

    expect(page).to have_link("Sign in with Github")

    click_link "Sign in with Github"

    expect(page).to have_content("jtruong2")
    expect(page).to have_link("Logout")
  end
end

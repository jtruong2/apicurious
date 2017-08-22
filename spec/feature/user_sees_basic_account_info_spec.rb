require 'rails_helper'
RSpec.describe "User visits account info", :type => :feature do
  it "and sees basic user information" do
    stub_omniauth

    visit root_path
    click_on "Sign in with Github"
    click_on "Account Information"
  save_and_open_page

    expect(page).to have_content("Jimmy Truong")
    expect(page).to have_content("jtruong2")
    expect(page).to have_content("jtruong2@comcast.net")
    expect(page).to have_content("25845955")
    expect(page).to have_css(".avatar")
  end
end

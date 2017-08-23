require 'rails_helper'
RSpec.describe "User visits user repo page", :type => :feature do
  it "and sees a list of repos" do
    stub_omniauth

    visit root_path
    click_on "Sign in with Github"
    click_on "My Repositories"

    expect(page).to have_content()
  end
end

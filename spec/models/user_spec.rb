require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates or updates itself from an oauth hash" do
    auth = stub_omniauth

    User.from_omniauth(auth)
    new_user = User.first

    expect(new_user.provider).to eq("github")
    expect(new_user.uid).to eq("25845955")
    expect(new_user.email).to eq("j10172799@gmail.com")
    expect(new_user.name).to eq("Jimmy Truong")
    expect(new_user.oauth_token).to eq(auth.credentials[:token])
  end
end

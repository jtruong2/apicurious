require 'rails_helper'

describe GithubService do
  describe "Users" do
    it "finds all account information" do
      VCR.use_cassette("services/find_account_info") do
        user_info = GithubService.find_account(ENV["OAUTH_TOKEN"])

        expect(user_info[:name]).to eq("Jimmy Truong")
        expect(user_info[:login]).to eq("jtruong2")
        expect(user_info[:id]).to eq(25845955)
      end
    end

    it "finds all repositories" do
      VCR.use_cassette("services/find_repositories") do
        user_info = GithubService.find_repositories(ENV["OAUTH_TOKEN"], "jtruong2")

        expect(user_info.count).to eq(39)
      end
    end
  end
end

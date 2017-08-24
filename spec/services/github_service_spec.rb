require 'rails_helper'

describe GithubService do

  username = "jtruong2"
  token = ENV["OAUTH_TOKEN"]

  describe "Users" do
    it "finds all account information" do
      VCR.use_cassette("services/find_account_info") do
        user_info = GithubService.find_account(token)

        expect(user_info[:name]).to eq("Jimmy Truong")
        expect(user_info[:login]).to eq(username)
        expect(user_info[:id]).to eq(25845955)
      end
    end

    it "finds all repositories" do
      VCR.use_cassette("services/find_repositories") do
        repositories = GithubService.find_repositories(token, username)

        expect(repositories.count).to eq(30)
        expect(repositories.first[:name]).to eq("active-record-sinatra")
      end
    end

    it "finds my recent commits" do
      VCR.use_cassette("services/find_commits") do
        commits = GithubService.my_recent_activity(token, username)

        expect(commits.count).to eq(13)
        expect(commits.keys.first).to eq("broke actions down to different models")
      end
    end

    it "finds activity for whom I follow" do
      VCR.use_cassette("services/following_activity") do
        activity = GithubService.following_activity(token, username)

        expect(activity.count).to eq(10)
        expect(activity[0][:type]).to eq("CreateEvent")
      end
    end

    it "finds all affilliated organizations" do
      VCR.use_cassette("services/organizations") do
        organizations = GithubService.find_organizations(token, username)

        expect(organizations.count).to eq(1)
        expect(organizations.first[:login]).to eq("1705-BE")
      end
    end

    it "finds all followers" do
      VCR.use_cassette("services/followers") do
        followers = GithubService.find_followers(token, username)

        expect(followers.count).to eq(2)
      end
    end

    it "finds users that I follow" do
      VCR.use_cassette("services/following") do
        following = GithubService.find_following(token, username)

        expect(following.count).to eq(3)
      end
    end

    it "finds starred repos count" do
      VCR.use_cassette("services/starred") do
        starred = GithubService.starred_repos(token, username)

        expect(starred.count).to eq(3)
      end
    end
  end
end

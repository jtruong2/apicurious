class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
     user.email = auth.info.email
     user.uid = auth.uid
     user.provider = auth.provider
     user.avatar_url = auth.extra.raw_info.avatar_url
     user.username = auth.info.nickname
     user.name = auth.info.name
     user.oauth_token = auth.credentials.token
     user.save!
    end
  end

  def self.find_account(token)
    GithubService.find_account(token)
  end

  def self.find_repositories(token, username)
    GithubService.find_repositories(token, username)
  end

  def self.my_recent_activity(token, username)
    GithubService.my_recent_activity(token, username)
  end

  def self.following_activity(token, username)
    GithubService.following_activity(token, username)
  end

  def self.find_organizations(token, username)
    GithubService.find_organizations(token, username)
  end
end

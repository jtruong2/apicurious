class AccountController < ApplicationController
  def show
    @results = Account.find_account(current_user.oauth_token)
    @followers = Account.find_followers(current_user.oauth_token, current_user.username)
    @following = Account.find_following(current_user.oauth_token, current_user.username)
    @starred_repos = Account.starred_repos(current_user.oauth_token, current_user.username)
  end
end

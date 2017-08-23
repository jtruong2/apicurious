class AccountController < ApplicationController
  def show
    @results = User.find_account(current_user.oauth_token)
  end
end

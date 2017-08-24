class AccountController < ApplicationController
  def show
    @results = Account.find_account(current_user.oauth_token)
  end
end

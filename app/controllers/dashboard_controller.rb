class DashboardController < ApplicationController
  def index
    @organizations = User.find_organizations(current_user.oauth_token, current_user.username)
  end
end

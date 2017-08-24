class DashboardController < ApplicationController
  def index
    @organizations = Dashboard.find_organizations(current_user.oauth_token, current_user.username)
  end
end

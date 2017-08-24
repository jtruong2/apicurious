class DashboardController < ApplicationController
  def index
    @organizations = find_organizations(current_user.token, current_user.username)
  end
end

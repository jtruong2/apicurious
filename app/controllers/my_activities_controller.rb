class MyActivitiesController < ApplicationController
  def index
    @commits = User.my_recent_activity(current_user.oauth_token, current_user.username)
  end
end

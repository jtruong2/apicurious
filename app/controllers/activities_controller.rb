class ActivitiesController < ApplicationController
  def index
    @my_commits = User.my_recent_activity(current_user.oauth_token, current_user.username)
    @following_activity = User.following_activity(current_user.oauth_token, current_user.username)
  end
end

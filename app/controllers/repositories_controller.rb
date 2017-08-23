class RepositoriesController < ApplicationController
  def index
    @repositories = User.find_repositories(current_user.oauth_token, current_user.username)
  end
end

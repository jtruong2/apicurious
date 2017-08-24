class Activity
  def self.my_recent_activity(token, username)
    GithubService.my_recent_activity(token, username)
  end

  def self.following_activity(token, username)
    GithubService.following_activity(token, username)
  end
end

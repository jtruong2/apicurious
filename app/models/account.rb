class Account
  def self.find_account(token)
    GithubService.find_account(token)
  end

  def self.find_followers(token, username)
    GithubService.find_followers(token, username)
  end

  def self.find_following(token, username)
    GithubService.find_following(token, username)
  end

  def self.starred_repos(token, username)
    GithubService.starred_repos(token, username)
  end
end

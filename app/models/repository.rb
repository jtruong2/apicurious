class Repository
  def self.find_repositories(token, username)
    GithubService.find_repositories(token, username)
  end
end

class Dashboard
  def self.find_organizations(token, username)
    GithubService.find_organizations(token, username)
  end
end

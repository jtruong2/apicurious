class Account
  def self.find_account(token)
    GithubService.find_account(token)
  end
end

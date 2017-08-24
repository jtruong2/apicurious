class GithubService

  def initialize(token, username)
    @token = token
    @username = username
    @conn = Faraday.new("https://api.github.com") do |faraday|
      faraday.authorization :Token, @token
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.find_account(token)
    new(token, nil).find_account
  end

  def find_account
    response = @conn.get("/user?access_token=#{@token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_repositories(token, user)
    new(token, user).find_repositories
  end

  def find_repositories
    response = @conn.get("/users/#{@username}/repos")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.my_recent_activity(token, user)
    new(token, user).my_recent_activity
  end

  def my_recent_activity
    commits = {}
    response = @conn.get("/users/#{@username}/events")
    result = JSON.parse(response.body, symbolize_names: true)
    result.each do |event|
      if event[:payload][:commits]
        event[:payload][:commits].each {|commit| commits[commit[:message]] = event[:repo][:name]}
      end
    end
    commits
  end

  def self.following_activity(token, user)
    new(token, user).following_activity
  end

  def following_activity
    response = @conn.get("/users/#{@username}/received_events")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_organizations(token, user)
    new(token, user).find_organizations
  end

  def find_organizations
    response = @conn.get("/users/#{@username}/orgs")
    JSON.parse(response.body, symbolize_names: true)
  end
end

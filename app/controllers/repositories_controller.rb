class RepositoriesController < ApplicationController
  def index
    conn = Faraday.get("https://api.github.com/users/jtruong2/repos")
    @results = JSON.parse(conn.body, symbolize_names: true)
  end
end

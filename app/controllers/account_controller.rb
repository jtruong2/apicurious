class AccountController < ApplicationController
  def show
    conn = Faraday.get("https://api.github.com/user?access_token=#{current_user.oauth_token}")
    @results = JSON.parse(conn.body, symbolize_names: true)
  end
end

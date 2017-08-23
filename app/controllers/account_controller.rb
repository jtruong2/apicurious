class AccountController < ApplicationController
  def show
    conn = Faraday.get("https://api.github.com/user?access_token=#{current_user.oauth_token}")
    response = conn.body
    @results = JSON.parse(response, symbolize_names: true)
  end
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, "YOUR_CONSUMER_API_KEY", "YOUR_CONSUMER_API_SECRET"
end

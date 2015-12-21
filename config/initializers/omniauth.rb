Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.development?
  provider :twitter, Rails.application.secrets.twitter_consumer_key, Rails.application.secrets.twitter_secret_key
end

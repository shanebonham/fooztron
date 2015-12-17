Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.development?
  provider :google_oauth2, 'foo', 'baar'
end
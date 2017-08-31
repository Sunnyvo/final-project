OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, ENV.fetch('FB_APP_ID'), ENV.fetch('FB_APP_KEY')
end

  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, '738c6c127b26e71fae84', 'c91f938695a9741ef14b4801d2c164e7977accc4'
  end

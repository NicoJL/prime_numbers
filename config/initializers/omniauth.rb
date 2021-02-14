Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], scope: 'chat:write'
end
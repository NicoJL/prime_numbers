Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, '1732998281767.1753942335972', 'e13427982a8b1af8d5add14056a64245', scope: 'chat:write'
end
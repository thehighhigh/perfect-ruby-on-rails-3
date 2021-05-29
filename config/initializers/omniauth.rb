Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development? || Rails.env.test?
    provider :github, "7a2a1a2d32cdacc98d5c", "4a3f132ca2a1bb175dd1684fb8ec8a2249afd63e"
  else
    provider :github,
      Rails.application.credentials.github[:client_id]
      Rails.application.credentials.github[:client_secret]
  end
end

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SorceryPractice
  class Application < Rails::Application
    config.load_defaults 6.1
    config.time_zone = "Tokyo"
    config.i18n.default_locale = :ja
    config.action_view.form_with_generates_remote_forms = true
  end
end

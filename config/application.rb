require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Prestacalculadora
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = false
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      :authentication => :plain,
      :address => "smtp.mailgun.org",
      :port => 587,
      :domain => ENV["MAILGUN_SMTP_DOMAIN"],
      :user_name => ENV["MAILGUN_SMTP_USERNAME"],
      :password => ENV["MAILGUN_SMTP_PASSWORD"]
    }
  end
end

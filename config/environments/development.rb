ZineDistro::Application.configure do
  # Settings specified here will take
  # precedence over those in config/application.rb

  # Turn off eager loading for Rails 4
  config.eager_load = false

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Print deprecation notices to the Rails logger
  # config.active_support.deprecation = :log

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
  config.sass.debug_info = true

  # source maps don't get output if this is true
  config.sass.line_comments = false

  # ActionMailer host
  # config.action_mailer.default_url_options = { host: 'localhost:3000' }
  #
  # Don't care if the mailer can't send
  # config.action_mailer.raise_delivery_errors = false

  config.after_initialize do
    Bullet.enable = true
    Bullet.rails_logger = true
  end
end

Holarse::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  config.eager_load = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # caching
  config.cache_store = :dalli_store, { pool_size: 5 }

  # Expands the lines which load the assets
  config.assets.debug = true

  config.serve_static_assets = true

  # Fix for running imagemagick using jruby
  Cocaine::CommandLine.runner = Cocaine::CommandLine::BackticksRunner.new

end

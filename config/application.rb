require 'rails/all'

module App
  class Application < Rails::Application
    # Use default logging configuration
    config.logger = ActiveSupport::Logger.new(STDOUT)
    config.log_level = :debug
  end
end

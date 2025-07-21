require_relative "boot"
require "rails/all"
require 'active_support/logger'
require 'active_support/core_ext/logger'


Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))

    config.api_only = true

    if Rails.env.test?
      ENV['DISABLE_BOOTSNAP'] = '1'
    end
  end
end

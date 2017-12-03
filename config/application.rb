require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module PranavYajnik
  class Application < Rails::Application
    config.load_defaults 5.1
    config.serve_static_assets = true
    config.middleware.use Rack::Deflater
  end
end

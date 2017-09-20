require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kongocoaching
  class Application < Rails::Application

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :fr
    config.time_zone = "Brussels"

    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.enabled = true

    #Needs to be false on Heroku
    config.assets.initialize_on_precompile = false
    # Can be set to invalidate the whole cache
    config.assets.version = "1.1"

    # Serving static assets and setting cache headers
    # which will be used by cloudfront as well
    config.serve_static_assets = true
    config.public_file_server.headers = { 'Cache-Control' => 'public, max-age=31536000' }
  end
end

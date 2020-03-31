require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.middleware.insert_before(Rails::Rack::Logger,
                                    RemoteIpProxyScrubber.filter_middleware,
                                    %w{
      199.27.128.0/21
      173.245.48.0/20
      103.21.244.0/22
      103.22.200.0/22
      103.31.4.0/22
      141.101.64.0/18
      108.162.192.0/18
      190.93.240.0/20
      188.114.96.0/20
      197.234.240.0/22
      198.41.128.0/17
      162.158.0.0/15
      104.16.0.0/12
      172.64.0.0/13
    })

    # Make sure the customer's real IP address (remote_ip)
    # is used in our Rails logs.
    config.middleware.insert_before(Rails::Rack::Logger, RemoteIpProxyScrubber.patched_logger)
    config.middleware.delete(Rails::Rack::Logger)

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

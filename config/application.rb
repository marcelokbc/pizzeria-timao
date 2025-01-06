require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

def set_locate_configs_and_timezone
  config.time_zone = "Brasilia"
  config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}").to_s]
  # config.i18n.load_path += Dir[Pagy.root.join('locales', '*.yml').to_s]
  config.i18n.available_locales = [:en, "pt-BR"]
  config.i18n.default_locale = :"pt-BR"
end

module PizzeriaTimao
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    set_locate_configs_and_timezone

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

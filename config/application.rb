require_relative "boot"

require "rails/all"


Bundler.require(*Rails.groups)

module ShiftManager
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])
    config.i18n.default_locale = :ja

    config.time_zone = 'Asia/Tokyo'
  end
end

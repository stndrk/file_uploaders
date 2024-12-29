# frozen_string_literal: true

source "https://rubygems.org"

gem "devise"
gem "importmap-rails"
gem "jbuilder"
gem "mini_magick"
gem "pg", "~> 1.1"
gem "propshaft"
gem "puma", ">= 5.0"
gem "rails", "~> 8.0.1"
gem "rest-client"
gem "rubocop-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "url_shortener"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "bootsnap", require: false
gem "dotenv-rails"
gem "kamal", require: false
gem "solid_cable"
gem "solid_cache"
gem "solid_queue"
gem "tzinfo-data", platforms: %i[windows jruby]

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "rubocop"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

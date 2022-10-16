# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.6"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 7.0.0"
# Use Puma as the app server
gem "puma", "~> 5.0"
# Use SCSS for stylesheets
gem "sass-rails"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "sprockets-rails"
gem 'shakapacker'

# Turbolinks doesn't play well with SPA
# gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem "logster"

gem "devise"
# gem "devise-jwt"
gem "pups"
gem "rack-cors"

gem "cancancan"
gem "rolify"

gem "omniauth"
gem "omniauth-rails_csrf_protection"

# by Alexander: I have personally seen that many schools and socio-educational
# projects for the inclusion of Online Learning use CAS or OAuth2 as SSO providers, so
# it was decided to add these strategies to OmniAuth
gem "omniauth-cas"
gem "omniauth-oauth2-generic"

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem "carrierwave", "~> 2.2" # Upload files in your Ruby applications, map them to a range of ORMs, store them on different backends
gem "carrierwave-bombshelter", "~> 0.2" # Protect your carrierwave from image bombs

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "rubocop", "~> 1.30", require: false # Automatic Ruby code style checking tool
  gem "rubocop-performance", "~> 1.14", require: false # A collection of RuboCop cops to check for performance optimizations in Ruby code
  gem "rubocop-rails", "~> 2.14", require: false # Automatic Rails code style checking tool
  gem "rubocop-rspec", "~> 2.11", require: false # Code style checking for RSpec files
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 4.1.0"
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "rack-mini-profiler", "~> 2.0"
end

group :development do
  gem "better_errors", "~> 2.9" # Provides a better error page for Rails and other Rack apps
  gem "binding_of_caller"
  gem "brakeman"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "sidekiq", "~> 6.4"

# Step-By-Step Wizard Controllers
gem "wicked"

group :development, :test do
  # Use sqlite3 as the database for Active Record on Development Environments
  gem "sqlite3", "~> 1.4"
  # RSpec for testing
  gem "rspec-rails"
end
group :production do
  gem "pg"
end

gem "highline"
gem "rails_material_design_icons"

gem "request_store", "~> 1.5" # RequestStore gives you per-request global storage
# For multi-lingual app
gem "i18n-js", "~> 3"
# Service Worker with asset pipeline
gem "serviceworker-rails"
gem "tailwindcss-rails-webpacker", "~> 0.2.1"

gem "gravtastic", "~> 3.2"
gem "net-http"
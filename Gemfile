source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4", ">= 7.0.4.2"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem "rubocop"
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem "factory_bot_rails"
  gem 'byebug'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'letter_opener_web', '~> 1.0'
end

group :production do
  gem 'pg'
end

gem "vite_rails", "~> 3.0"
gem 'cssbundling-rails'
gem 'sorcery'
gem 'ransack'
gem 'rails-i18n', '~> 7.0.0'
gem 'mini_magick'
gem 'carrierwave'
gem "ruby-openai"
gem 'dotenv-rails', groups: [:development, :test]
gem 'friendly_id'
gem 'config'
gem 'actionmailer'
gem 'omniauth-google-oauth2'

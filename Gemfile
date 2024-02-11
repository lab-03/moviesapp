source "https://rubygems.org"

ruby "3.1.2"

gem "rails", "~> 7.1.3"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "tailwindcss-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "factory_bot_rails"
  gem "dotenv-rails"
  gem "rspec-rails"
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "bundler-audit", require: false
  gem "brakeman", require: false
  gem "annotate"
  gem "web-console"
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
end

group :test do
  gem "shoulda-matchers"
  gem "selenium-webdriver"
  gem "capybara"
end

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

gem "rails", "~> 7.0.4", ">= 7.0.4.3"

gem 'sassc-rails'

gem "sprockets-rails"

gem "pg", "~> 1.1"

gem "puma", "~> 5.0"

# gem "jsbundling-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false

gem 'msgpack', '~> 1.6'

gem 'nio4r', '~> 2.5', '>= 2.5.9'

gem 'byebug', '~> 11.1', '>= 11.1.3'

gem 'devise'

gem 'cancancan'

gem 'factory_bot_rails', '~> 6.2'

gem 'faker', '~> 3.2'

gem 'activeadmin', '~> 2.13', '>= 2.13.1'
gem 'bootstrap-sass'
gem 'cloudinary', '~> 1.25'

group :development, :test do
  gem 'debug', '~> 1.8', platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem 'shoulda-matchers', require: false
  gem "selenium-webdriver"
  gem "webdrivers"
end

source "https://rubygems.org"

git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.7.0"

gem "rails", "~> 7.0.1"

gem "sprockets-rails"

gem "mysql2", "~> 0.5"

gem "puma", "~> 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)

gem "bootsnap", require: false

gem "config"

gem "bootstrap-sass", "3.4.1"

gem "rails-i18n"

gem "bcrypt", "3.1.13"

gem "webpacker"

gem "jquery-rails"

group :development, :test do
  gem "pry", "~>0.14.0"
  gem "rubocop", "~> 0.74.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.3.2", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

source 'http://rubygems.org'
gem 'rails', '3.1.0'

gem 'capistrano'
gem 'jquery-rails'
gem 'hirb'
gem 'devise'
gem 'cancan'

group :production do
  gem 'mysql'
end

group :test, :development do
  gem 'sqlite3'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem "rspec-rails", ">= 2.6.1"
  gem "factory_girl_rails", ">= 1.1.0"
  gem "selenium-webdriver", ">= 2.10.0"
  gem "cucumber", ">= 1.1.2"
  gem "cucumber-rails", ">= 1.2.0"
  gem "webrat"
  gem "capybara", ">= 1.1.0"
  gem "database_cleaner", ">= 0.6.7"
end

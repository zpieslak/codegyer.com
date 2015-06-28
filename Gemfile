source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.13'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use SCSS compass classes
gem 'compass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'

# Use debugger
# gem 'debugger', group: [:development, :test]

# Flexible authentication solution for Rails with Warden
gem 'devise'

# Mailto antispam
gem 'actionview-encoded_mail_to'

# html5 validations
gem 'html5_validators'

# Jquery turbolinks fix
gem 'jquery-turbolinks'

# Active admin interface
gem 'activeadmin', '~> 1.0.0.pre1'

# Add friendly id url
gem 'friendly_id'

# Pagination
gem 'kaminari'

# Page caching
gem 'actionpack-page_caching'

# Generate sitemap
gem 'sitemap_generator'

# XML parser
gem 'nokogiri'

group :development do
  # Use Capistrano for deployment
  gem 'capistrano', '~> 2.0', group: :development

  # Hide assets on development
  gem 'quiet_assets'
end

group :development, :test do
  # Test framework
  gem 'rspec-rails'
end

group :test do
  # Faker, a port of Data::Faker from Perl, is used to easily generate fake data
  # names, addresses, phone numbers, etc
  gem 'faker'

  # Provides integration between factory_girl and rails
  gem 'factory_girl_rails'

  # The instafailing RSpec progress bar formatter
  gem 'fuubar'

  # Capybara is an integration testing tool for rack based web applications
  gem 'capybara'

  # Poltergeist is a driver for Capybara that allows you to run your tests on a
  # headless WebKit browser, provided by PhantomJS.
  gem 'poltergeist'

  # Test your ActionMailer and Mailer messages in Capybara
  gem 'capybara-email'

  # Strategies for cleaning databases
  gem 'database_cleaner'

  # Automatic Ruby code style checking tool. Aims to enforce
  # the community-driven Ruby Style Guide.
  gem 'rubocop', require: false

  # Temporary lock parser gem
  gem "parser", "~> 2.2.0"
end

source 'https://rubygems.org'
ruby '2.1.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

#REMOVED
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
## Turbolinks removed
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
## jbuilder removed
# Templates for angular-rails. Creates the views that angular uses.
# gem 'angular-rails-templates'

# ADDED

# Better Errors
gem 'better_errors', '~>2.1.1'
# Some stuff
gem 'binding_of_caller'
# Oauth Gem
gem 'oauth2'
# HTTParty gem
gem 'httparty'
# Acts as votable allows any model to be voted on, like/dislike, upvote/downvote, etc.
gem 'acts_as_votable', '~> 0.10.0'
# Serializers describe which attributes and relationships should be serialized
gem 'active_model_serializers'
# bcrypt is a key derivation function for passwords, or simply a password maker
gem 'bcrypt'
# Bower is a package manager for Javascript libraries that allows you to define,
# version, and retrieve your dependencies. Rails is a package or gem that allows you
# to use bower with rails
gem 'bower-rails'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Rspec for running tests
  gem 'rspec', '~> 3.2.0'
  gem 'rspec-rails'
  gem 'database_cleaner'

  # Shoulda
  gem 'shoulda-matchers'

  # Factory Girl for tests
  gem 'factory_girl'
  gem 'factory_girl_rails'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Record HTTP Requests for tests
  gem 'vcr'
  gem 'webmock', require: false

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen'

  # Guard for Autorunning Tests
  gem 'guard-rspec', require: false
  gem 'rspec-legacy_formatters'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
end


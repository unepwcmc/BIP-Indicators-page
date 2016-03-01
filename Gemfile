source 'https://rubygems.org'

gem 'rails', '3.2.22.2'
gem 'json', '>=1.7.7'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.6'
  gem 'coffee-rails', '~> 3.2.2'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'rails-backbone', '~> 0.8.0'

gem 'bootstrap-generators', '~> 2.0', :git => 'git://github.com/decioferreira/bootstrap-generators.git'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem 'jquery-rails', '~> 2.1.3'
gem 'ejs'

gem 'rspec-rails', '~> 2.6', :group => [:development, :test]

group :test do
  gem 'minitest' # compat
  gem 'capybara'
  # LocalStorage support: https://github.com/thoughtbot/capybara-webkit/pull/310
  gem 'capybara-webkit', "~> 0.13.1"
  gem 'headless'
  gem 'guard-rspec'
  gem 'shoulda'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'launchy'
end

group :development do
  gem 'capistrano', '~> 3.4', require: false
  gem 'capistrano-rails',   '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
  gem 'capistrano-rvm',   '~> 0.1', require: false
  gem 'capistrano-passenger', '~> 0.1.1', require: false

end

gem 'spreadsheet'

gem 'test-unit', '~> 3.1' # annoyingly, rails console won't start without it in staging / production

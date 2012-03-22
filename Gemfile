source 'https://rubygems.org'

gem 'rails', '3.2.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'json'
gem 'jquery-rails'
gem 'devise'
gem 'cancan'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'kaminari'
gem 'yajl-ruby', :require => "yajl"
gem 'carrierwave'
gem 'rmagick'

gem 'whenever', :require => false

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails', :git => 'http://github.com/seyhunak/twitter-bootstrap-rails.git'
end

group :development, :test do
  gem 'rspec-rails', '2.8.1'
  gem 'simplecov', '0.6.1', :require => false
end

group :development do
  gem 'sqlite3'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'launchy'
  gem 'faker'
  gem "capybara"
  gem 'cucumber-rails'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem "spork", "> 0.9.0.rc"
  gem "guard-spork"
end

# notify
group :linux_development do
  gem "rb-inotify"
  gem "libnotify"
end
group :mac_development do
  gem "growl"
end

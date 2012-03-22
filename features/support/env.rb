require 'rubygems'
require 'spork'

Spork.prefork do
  require "rails/application"
  # Prevent Devise from loading the User model super early with it's route hacks for Rails 3.1 rc4
  # see also: https://github.com/timcharper/spork/wiki/Spork.trap_method-Jujutsu
  Spork.trap_method(Rails::Application, :reload_routes!)
  Spork.trap_method(Rails::Application::RoutesReloader, :reload!)
  
  
  require 'cucumber/rails'
  
  Capybara.default_selector = :css
  Capybara.app_host = "http://localhost"
  ActionController::Base.allow_rescue = false  
end

Spork.each_run do
  # This code will be run each time you run your specs.
  # Remove/comment out the lines below if your app doesn't have a database.
  # For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
  begin
    DatabaseCleaner.strategy = :truncation
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end
end

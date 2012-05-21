require 'spork'
 
Spork.prefork do
  ENV["RAILS_ENV"] = 'test'
  require File.expand_path("../../../config/environment", __FILE__)
  require 'cucumber/rails'
  require 'factory_girl/step_definitions'
  require 'capybara/firebug'
  require_relative 'paths'

  World(KnowsAboutPaths)

  Capybara.default_selector = :css
  Capybara.default_driver = :selenium
end
 
Spork.each_run do
  ActionController::Base.allow_rescue = false
  
  DatabaseCleaner.orm = 'mongoid'
  DatabaseCleaner.strategy = :truncation
end

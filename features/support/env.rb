require 'spork'
 
Spork.prefork do
  ENV["RAILS_ENV"] = 'test'
  require File.expand_path("../../../config/environment", __FILE__)
  require 'cucumber/rails'
  require 'factory_girl/step_definitions'
  require 'capybara/firebug'
  require 'delorean'
  require_relative 'paths'

  World(KnowsAboutPaths)

  Capybara.default_selector = :css
  Capybara.default_driver = :selenium

  ActionController::Base.allow_rescue = false
  
  DatabaseCleaner.orm = 'mongoid'
  DatabaseCleaner.strategy = :truncation

  Before do
    DatabaseCleaner.start
  end

  After do
    Delorean.back_to_the_present
    DatabaseCleaner.clean
  end
end
 
Spork.each_run do
end

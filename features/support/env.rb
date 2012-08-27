require 'spork'
 
Spork.prefork do
  ENV["RAILS_ENV"] = 'test'
  require File.expand_path("../../../config/environment", __FILE__)
  require 'cucumber/rails'
  require 'delorean'
  require_relative 'paths'
  require_relative 'helpers'

  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end

  World(KnowsAboutPaths, Helpers)

  Capybara.default_selector = :css
  Capybara.default_driver = :chrome

  ActionController::Base.allow_rescue = false
  
  DatabaseCleaner.orm = 'mongoid'
  DatabaseCleaner.strategy = :truncation

  Before do
    DatabaseCleaner.start
    Capybara.current_session.driver.browser.manage.window.resize_to 1250, 900
  end

  After do
    Delorean.back_to_the_present
    DatabaseCleaner.clean
  end
end
 
Spork.each_run do
end

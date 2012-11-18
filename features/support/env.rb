ENV["RAILS_ENV"] = 'test'
require File.expand_path("../../../config/environment", __FILE__)
require 'cucumber/rails'
require 'delorean'
require_relative 'paths'
require_relative 'helpers'
require 'anticipate'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

World(KnowsAboutPaths, Helpers, Anticipate)

Capybara.default_selector = :css
Capybara.default_driver = :chrome

ActionController::Base.allow_rescue = false

DatabaseCleaner.strategy = :truncation

Before do
  DatabaseCleaner.start

  # or else twitter bootstrap navbar collapses and capybara can't press nav buttons
  Capybara.current_session.driver.browser.manage.window.resize_to 1250, 900
end

After do
  Delorean.back_to_the_present
  DatabaseCleaner.clean
end

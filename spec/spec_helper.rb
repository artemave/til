ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'active_support/testing/assertions'
require 'awesome_print'
require 'delorean'
require 'factory_girl'

RSpec.configure do |config|
  config.order = "random"

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  config.use_transactional_fixtures = true

  config.include ActiveSupport::Testing::Assertions
  config.include FactoryGirl::Syntax::Methods

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  config.after(:each) do
    Delorean.back_to_the_present
  end
end

Dir[Rails.root.join("spec/support/**/*.rb")].each &method(:require)

# frozen_string_literal: true

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'factory_bot_rails'
require 'database_cleaner'
require 'capybara/rails'
require 'mongoid-rspec'

RSpec.configure do |config|
  config.use_active_record = false
  config.use_transactional_fixtures = false
  config.include FactoryBot::Syntax::Methods
  config.include Mongoid::Matchers, type: :model
  # helpers for sessions with devise
  config.include Warden::Test::Helpers
  config.include Devise::Test::ControllerHelpers, type: 'controller'
  config.include Devise::Test::IntegrationHelpers, type: 'request'
  config.include Devise::Test::IntegrationHelpers, type: 'system'
  config.before(:suite) do
    DatabaseCleaner.orm = 'mongoid'
    DatabaseCleaner.clean
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.before(:each, type: :system) do
    driven_by(:rack_test)
  end

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

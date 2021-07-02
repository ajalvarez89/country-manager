# frozen_string_literal: true

unless Rails.env.production?
  require 'dotenv'
  Dotenv.load('.env')
end

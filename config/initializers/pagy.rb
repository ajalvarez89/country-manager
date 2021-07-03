# frozen_string_literal: true

require 'pagy/extras/array'
require 'pagy/extras/bootstrap'

Pagy::VARS[:items] = ENV['MAX_ITEMS_PAGINATION']
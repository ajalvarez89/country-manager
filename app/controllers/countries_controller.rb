# frozen_string_literal: true

class CountriesController < ApplicationController
  before_action :set_countries, only: :index

  def index; end

  private

  def set_countries
    @countries = { value: 'test' }
  end
end

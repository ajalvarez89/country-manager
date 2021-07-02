# frozen_string_literal: true

class CountriesController < ApplicationController
  before_action :set_countries, only: :index

  def index
    @pagy, @countries = pagy_array(@countries)
  end

  private

  def set_countries
    @countries = Requests::CountryService.request.map { |response| Country.new(response) }
  end
end

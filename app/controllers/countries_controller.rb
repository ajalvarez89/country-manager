# frozen_string_literal: true

class CountriesController < ApplicationController
  before_action :set_countries, only: %i[index show edit]
  before_action :set_country, only: %i[index show edit]

  def index
    @pagy, @countries = pagy_array(@countries)
  end

  def show; end

  def edit; end


  private

  def set_country
    @country ||= @countries.find do |country|
      country.name == params[:id]
    end
  end

  def set_countries
    @countries ||= Requests::CountryService.request.map { |response| Country.new(response) }
  end
end

# frozen_string_literal: true

class CountriesController < ApplicationController
  before_action :set_countries, only: :index
  before_action :set_country, only: %i[show edit update destroy]

  def index
    @pagy, @countries = pagy_array(Country.all.recents)
  end

  def show; end

  def new
    @country = Country.new
  end

  def edit; end

  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to @country, notice: 'Country was successfully updated.' }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_url, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    CountryPermittedParams.permitted_params_for(params[:country]).to_h
  end

  def set_countries
    return unless Country.all.empty?

    Requests::CountryService.new.execute
  end
end

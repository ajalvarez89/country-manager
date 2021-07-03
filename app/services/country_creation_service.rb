# frozen_string_literal: true

class CountryCreationService
  attr_reader :params

  def initialize(params:)
    @params = params.with_indifferent_access
  end

  def execute!
    country = Country.new(permitted_params)
    country.save!

    raise(ActiveRecord::ActiveRecordError) unless country.valid?

    true
  end

  private

  def permitted_params
    @permitted_params ||= CountryPermittedParams
      .permitted_params_for(ActionController::Parameters.new(params)).to_h
  end
end

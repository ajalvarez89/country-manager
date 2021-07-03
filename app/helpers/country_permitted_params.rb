# frozen_string_literal: true

class CountryPermittedParams
  PERMITTED_PARAMS = %i[name capital region subregion flag].freeze

  class << self
    def permitted_params_for(params)
      permitted_attributes = PERMITTED_PARAMS.dup

      params.permit(permitted_attributes).to_h
    end
  end
end

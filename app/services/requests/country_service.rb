# frozen_string_literal: true

require 'rest-client'

module Requests
  class CountryService
    def execute
      headers = {
        content_type: :json,
        accept: :json
      }

      begin
        response = RestClient::Request.execute(
          method: :get,
          url: ENV['COUNTRIES_API_URI'],
          headers: headers
        )

        build_countries(response)
      rescue StandardError => exception
        exception
      end
    end

    private

    def build_countries(response)
      parsed_params = JSON.parse(response.body, symbolize_names: true).reverse

      parsed_params.each do |params|
        CountryCreationService.new(params: params).execute!
      end
    end
  end
end

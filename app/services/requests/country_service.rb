# frozen_string_literal: true

require 'rest-client'

module Requests
  class CountryService
    def self.request
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

        JSON.parse(response.body, symbolize_names: true)
      rescue StandardError => exception
        exception.response
      end
    end
  end
end

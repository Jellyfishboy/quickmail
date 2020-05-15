# frozen_string_literal: true

module Quickmail
  class Authentication

    class << self
      def create(payload = {})
        RestClient::Request.new({
            method: :post,
            url: API_BASE + '/token',
            payload: payload ? payload.to_json : nil,
            headers: {content_type: "application/x-www-form-urlencoded"}
          }).execute do |response, request, result|
          if response.code != 201
            raise ApiRequestError.new(
              response_code: response.code,
              response_headers: response.headers,
              response_body: response.to_str
            )
          end
          response
        end
      end
    end
  end
end

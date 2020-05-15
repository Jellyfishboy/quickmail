# frozen_string_literal: true

module Quickmail
  class Authentication

    class << self
      def oauth(payload = {})
        RestClient::Request.new({
            method: :post,
            url: Quickmail.api_base + '/token',
            payload: payload,
            headers: {content_type: "application/x-www-form-urlencoded"}
          }).execute do |response, request, result|
          if response.code != 200
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

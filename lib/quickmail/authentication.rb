# frozen_string_literal: true

module Quickmail
  class Authentication

    class << self
      def oauth(payload = {})
        RestClient::Request.new({
                                  method: :post,
                                  url: Quickmail.api_base + 'token',
                                  payload: payload,
                                  headers: {content_type: "application/x-www-form-urlencoded"}
                                }).execute do |response, request, result|
          str_response = response.to_str
          str_response.blank? ? '' : JSON.parse(str_response)
        end
      end
    end
  end
end

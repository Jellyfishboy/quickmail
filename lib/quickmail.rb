# frozen_string_literal: true

require 'rest-client'

require 'quickmail/order'

module Quickmail

  API_BASE = "https://quickmailonline.com.au/api/"

  class QuickmailError < StandardError
  end

  class AuthenticationError < QuickmailError;
  end
  class ConfigurationError < QuickmailError;
  end
  class ApiRequestError < QuickmailError
    attr_reader :response_code, :response_headers, :response_body

    def initialize(response_code:, response_headers:, response_body:)
      @response_code = response_code
      @response_headers = response_headers
      @response_body = response_body
    end
  end

  class << self
    def username
      defined? @username and @username or raise(
        ConfigurationError, "Quickmail username not configured"
      )
    end

    attr_writer :username

    def password
      defined? @password and @password or raise(
        ConfigurationError, "Quickmail password not configured"
      )
    end

    attr_writer :password

    def request(method, resource, params = {})
      ss_username = params[:username] || Quickmail.username
      ss_password = params[:password] || Quickmail.password
      ss_api_version = Quickmail.api_version || "v1"

      params.except!(:username, :password)

      defined? method or raise(
        ArgumentError, "Request method has not been specified"
      )
      defined? resource or raise(
        ArgumentError, "Request resource has not been specified"
      )
      if method == :get
        headers = {accept: :json, content_type: :json}.merge({params: params})
        payload = nil
      else
        headers = {accept: :json, content_type: :json}
        payload = params
      end
      RestClient::Request.new({
                                method: method,
                                url: API_BASE + ss_api_version + '/' + resource,
                                user: ss_username,
                                password: ss_password,
                                payload: payload ? payload.to_json : nil,
                                headers: headers
                              }).execute do |response, request, result|
        if response.code != 200
          raise ApiRequestError.new(
            response_code: response.code,
            response_headers: response.headers,
            response_body: response.to_str
          )
        end
        str_response = response.to_str
        str_response.blank? ? '' : JSON.parse(str_response)
      end
    end

    def datetime_format(datetime)
      datetime.strftime("%Y-%m-%d %T")
    end
  end
end

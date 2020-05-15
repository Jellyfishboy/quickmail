# frozen_string_literal: true

require 'rest-client'

require 'quickmail/authentication'
require 'quickmail/order'
require 'quickmail/tracking'

module Quickmail

  class QuickmailError < StandardError
  end

  class AuthenticationError < QuickmailError; end

  class ConfigurationError < QuickmailError; end

  class ApiRequestError < QuickmailError
    attr_reader :response_code, :response_headers, :response_body

    def initialize(response_code:, response_headers:, response_body:)
      @response_code = response_code
      @response_headers = response_headers
      @response_body = response_body
    end
  end

  class << self

    attr_writer :access_token, :api_version, :test_mode, :api_base

    def access_token
      defined? @access_token and @access_token or raise(
        ConfigurationError, "Quickmail access token not configured"
      )
    end

    def api_version
      defined? @api_version and @api_version or raise(
        ConfigurationError, "Quickmail api version not configured"
      )
    end

    def test_mode
      @test_mode.nil? ? false : @test_mode
    end

    def api_base
      Quickmail.test_mode ? "https://quickmailonline.com.au/api/test/" : "https://quickmailonline.com.au/api/"
    end

    def request(method, resource, params = {})
      ss_access_token = params[:access_token] || Quickmail.access_token
      ss_api_version = Quickmail.api_version

      params.except!(:access_token)

      defined? method or raise(
        ArgumentError, "Request method has not been specified"
      )
      defined? resource or raise(
        ArgumentError, "Request resource has not been specified"
      )
      if method == :get
        headers = {accept: :json, content_type: :json, Authorization: "Bearer #{ss_access_token}"}.merge({params: params})
        payload = nil
      else
        headers = {accept: :json, content_type: :json, Authorization: "Bearer #{ss_access_token}"}
        payload = params
      end
      RestClient::Request.new({
                                method: method,
                                url: Quickmail.api_base + ss_api_version + '/' + resource,
                                payload: payload,
                                headers: headers
                              }).execute do |response, request, result|
        if response.code != 201 || response.code != 200
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

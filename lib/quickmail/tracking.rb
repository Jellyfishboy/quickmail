# frozen_string_literal: true

module Quickmail
  class Tracking

    class << self
      def poll(params = {}, access_token = nil)
        response = Quickmail.request(:get, 'tracking', params, access_token)

        response
      end
    end
  end
end

# frozen_string_literal: true

module Quickmail
  class Tracking

    class << self
      def poll(params = {})
        response = Quickmail.request(:get, 'tracking', params)

        response
      end
    end
  end
end

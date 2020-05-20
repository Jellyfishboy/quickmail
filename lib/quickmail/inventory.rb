# frozen_string_literal: true

module Quickmail
  class Inventory

    class << self

      def list(access_token = nil)
        response = Quickmail.request(:get, 'inventory', access_token)

        response
      end
    end
  end
end
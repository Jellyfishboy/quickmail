# frozen_string_literal: true

module Quickmail
  class Inventory

    class << self

      def list
        response = Quickmail.request(:get, 'inventory')

        response
      end
    end
  end
end
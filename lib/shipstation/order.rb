# frozen_string_literal: true

module Quickmail
  class Order

    class << self
      def create(params = {})
        response = Quickmail.request(:post, 'orders', params)

        response
      end
    end
  end
end

# frozen_string_literal: true

module Quickmail
  class Order

    class << self
      def create(params = {}, access_token=nil)
        response = Quickmail.request(:post, 'orders', params, access_token)

        response
      end
    end
  end
end

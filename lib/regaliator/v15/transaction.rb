require 'regaliator/endpoint'

module Regaliator
  module V15
    class Transaction < Endpoint
      def list(params = {})
        request('/transactions', params).post
      end
    end
  end
end

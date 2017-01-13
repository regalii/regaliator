require 'regaliator/endpoint'

module Regaliator
  module V30
    class Transaction < Endpoint
      def list(params = {})
        request('/transactions', params).get
      end
    end
  end
end

require 'regaliator/endpoint'

module Regaliator
  module V15
    class Biller < Endpoint
      def topups(params = {})
        request('/billers/topups', params).post
      end

      def utilities(params = {})
        request('/billers/utilities', params).post
      end
    end
  end
end

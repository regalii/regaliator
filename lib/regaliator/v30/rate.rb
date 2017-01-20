require 'regaliator/endpoint'

module Regaliator
  module V30
    class Rate < Endpoint
      def list
        request('/rates').get
      end

      def history
        request('/rates/history').get
      end
    end
  end
end

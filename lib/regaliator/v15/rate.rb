require 'regaliator/endpoint'

module Regaliator
  module V15
    class Rate < Endpoint
      def list
        request('/rates').post
      end

      def history
        request('/rates/history').post
      end
    end
  end
end

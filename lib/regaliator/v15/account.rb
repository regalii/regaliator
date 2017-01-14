require 'regaliator/endpoint'

module Regaliator
  module V15
    class Account < Endpoint
      def info
        request('/account').post
      end
    end
  end
end

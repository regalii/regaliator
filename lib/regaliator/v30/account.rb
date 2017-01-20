require 'regaliator/endpoint'

module Regaliator
  module V30
    class Account < Endpoint
      def info
        request('/account').get
      end
    end
  end
end

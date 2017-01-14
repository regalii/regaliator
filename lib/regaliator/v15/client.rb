require 'regaliator/client'
require 'regaliator/v15/account'
require 'regaliator/v15/bill'

module Regaliator
  module V15
    class Client < Client
      def account
        Account.new(config)
      end

      def bill
        Bill.new(config)
      end
    end
  end
end

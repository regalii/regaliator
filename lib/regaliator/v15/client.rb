require 'regaliator/client'
require 'regaliator/v15/account'
require 'regaliator/v15/bill'
require 'regaliator/v15/biller'
require 'regaliator/v15/rate'
require 'regaliator/v15/transaction'

module Regaliator
  module V15
    class Client < Client
      def account
        Account.new(config)
      end

      def bill
        Bill.new(config)
      end

      def biller
        Biller.new(config)
      end

      def rate
        Rate.new(config)
      end

      def transaction
        Transaction.new(config)
      end
    end
  end
end

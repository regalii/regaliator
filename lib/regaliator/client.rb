require 'regaliator/account'
require 'regaliator/bill'
require 'regaliator/biller'
require 'regaliator/rate'
require 'regaliator/transaction'

module Regaliator
  class Client
    attr_accessor :config

    def initialize(config = Regaliator.configuration)
      @config = config
    end

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

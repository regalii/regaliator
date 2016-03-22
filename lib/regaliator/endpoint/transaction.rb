module Regaliator
  class Transaction < Endpoint
    def self.list(*args)
      Regaliator::Request.new('transactions', args.first).post
    end
  end
end

module Regaliator
  class Transaction < Endpoint
    def self.list(params = {})
      Regaliator::Request.new('/transactions', params).get
    end
  end
end

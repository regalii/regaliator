module Regaliator
  class Account < Endpoint
    def self.info
      Regaliator::Request.new('/account').get
    end
  end
end

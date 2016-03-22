module Regaliator
  class Account < Endpoint
    def self.info(*args)
      Regaliator::Request.new('account', args.first).post
    end
  end
end

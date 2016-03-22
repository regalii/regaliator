module Regaliator
  class Rate < Endpoint
    def self.list(*args)
      Regaliator::Request.new('rates', args.first).post
    end

    def self.history(*args)
      Regaliator::Request.new('rates/history', args.first).post
    end
  end
end

module Regaliator
  class Biller < Endpoint
    def self.list(*args)
      Regaliator::Request.new('billers', args.first).post
    end
  end
end

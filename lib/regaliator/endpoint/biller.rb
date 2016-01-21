module Regaliator
  class Biller < Endpoint
    def self.list(*args)
      prepare_request('billers', args.first).post
    end
  end
end

module Regaliator
  class Rate < Endpoint
    def self.list(*args)
      prepare_request('rates', args.first).post
    end

    def self.history(*args)
      prepare_request('rates/history', args.first).post
    end
  end
end

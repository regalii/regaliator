module RegaliiCli
  class Bill < Endpoint
    def self.consult(*args)
      prepare_request('bill/consult', args.first).post
    end

    def self.pay(*args)
      prepare_request('bill/pay', args.first).post
    end
  end
end

module RegaliiCli
  class Transaction < Endpoint
    def self.list(*args)
      prepare_request('transactions', args.first).post
    end
  end
end

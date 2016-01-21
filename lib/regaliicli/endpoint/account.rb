module RegaliiCli
  class Account < Endpoint
    def self.info(*args)
      prepare_request('account', args.first).post
    end
  end
end

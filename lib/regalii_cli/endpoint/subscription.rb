module RegaliiCli
  class Subscription < Endpoint
    def self.create(*args)
      prepare_request('subscriptions/create', args.first).post
    end

    def self.update(*args)
      prepare_request('subscriptions/update', args.first).post
    end

    def self.refresh(*args)
      prepare_request('subscriptions/refresh', args.first).post
    end

    def self.consult(*args)
      prepare_request('subscriptions/consult', args.first).post
    end
  end
end

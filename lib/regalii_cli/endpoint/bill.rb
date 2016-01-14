module RegaliiCli
  class Bill < Endpoint
    def self.create(*args)
      prepare_request('bill/create', args.first).post
    end

    def self.show(*args)
      prepare_request('bill/show', args.first).post
    end

    def self.update(*args)
      prepare_request('bill/update', args.first).post
    end

    def self.refresh(*args)
      prepare_request('bill/refresh', args.first).post
    end

    def self.pay(*args)
      prepare_request('bill/pay', args.first).post
    end
  end
end

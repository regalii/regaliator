module Regaliator
  class Bill < Endpoint
    def self.create(*args)
      Regaliator::Request.new('bill/create', args.first).post
    end

    def self.show(*args)
      Regaliator::Request.new('bill/show', args.first).post
    end

    def self.update(*args)
      Regaliator::Request.new('bill/update', args.first).post
    end

    def self.refresh(*args)
      Regaliator::Request.new('bill/refresh', args.first).post
    end

    def self.pay(*args)
      Regaliator::Request.new('bill/pay', args.first).post
    end
  end
end

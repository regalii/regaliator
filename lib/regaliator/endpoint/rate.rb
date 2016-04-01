module Regaliator
  class Rate < Endpoint
    def self.list
      Regaliator::Request.new('/rates').get
    end

    def self.history
      Regaliator::Request.new('/rates/history').get
    end
  end
end

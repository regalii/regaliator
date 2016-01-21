module Regaliator
  class Endpoint
    def self.prepare_request(endpoint, params = {})
      Regaliator::Request.new(endpoint, params)
    end
  end
end

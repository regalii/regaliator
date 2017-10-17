require 'regaliator/endpoint'

module Regaliator
  class Rate < Endpoint
    def list
      request('/rates').post
    end

    def history
      request('/rates/history').post
    end
  end
end

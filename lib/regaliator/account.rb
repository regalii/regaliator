require 'regaliator/endpoint'

module Regaliator
  class Account < Endpoint
    def info
      request('/account').post
    end
  end
end

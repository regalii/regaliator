require 'regaliator/endpoint'

module Regaliator
  class Transaction < Endpoint
    def list(params = {})
      request('/transactions', params).post
    end

    def pay(params = {})
      request('/transaction/pay', params).post
    end

    def reverse(params = {})
      request('/transaction/reverse', params).post
    end

    def cancel(params = {})
      request('/transaction/cancel', params).post
    end
  end
end

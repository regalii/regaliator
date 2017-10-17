require 'regaliator/endpoint'

module Regaliator
  class Bill < Endpoint
    def index(params = {})
      request('/bills', params).post
    end

    def consult(params = {})
      request('/bill/consult', params).post
    end

    def pay(params = {})
      request('/bill/pay', params).post
    end

    def check(params = {})
      request('/bill/check', params).post
    end
  end
end

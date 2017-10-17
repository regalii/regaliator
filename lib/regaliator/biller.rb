require 'regaliator/endpoint'

module Regaliator
  class Biller < Endpoint
    def topups(params = {})
      request('/billers/topups', params).post
    end

    def utilities(params = {})
      request('/billers/utilities', params).post
    end
  end
end

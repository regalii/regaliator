module Regaliator
  class Biller < Endpoint
    def self.credentials(params = {})
      Regaliator::Request.new('/billers/credentials', params).get
    end

    def self.topups(params = {})
      Regaliator::Request.new('/billers/topups', params).get
    end

    def self.utilities(params = {})
      Regaliator::Request.new('/billers/utilities', params).get
    end
  end
end

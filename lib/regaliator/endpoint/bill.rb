module Regaliator
  class Bill < Endpoint
    def self.create(params = {})
      Regaliator::Request.new('/bills', params).post
    end

    def self.show(id)
      Regaliator::Request.new("/bills/#{id}").get
    end

    def self.update(id, params = {})
      Regaliator::Request.new("/bills/#{id}", params).patch
    end

    def self.refresh(id)
      Regaliator::Request.new("/bills/#{id}/refresh").post
    end

    def self.pay(id, params = {})
      Regaliator::Request.new("/bills/#{id}/pay", params).post
    end

    def self.xdata(id)
      Regaliator::Request.new("/bills/#{id}/xdata").get
    end

    def self.xchange(id, params = {})
      Regaliator::Request.new("/bills/#{id}/xchange").post
    end
  end
end

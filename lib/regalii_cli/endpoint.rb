module RegaliiCli
  class Endpoint
    def self.prepare_request(endpoint, params = {})
      RegaliiCli::Request.new(endpoint, params)
    end
  end
end

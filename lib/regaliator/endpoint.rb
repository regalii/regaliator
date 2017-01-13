require 'regaliator/request'

module Regaliator
  class Endpoint
    attr_reader :config

    def initialize(config)
      @config = config
    end

    private

    def request(*args)
      Request.new(config, *args)
    end
  end
end

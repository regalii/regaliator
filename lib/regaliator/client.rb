module Regaliator
  class Client
    attr_accessor :config

    def initialize(config)
      @config = config
    end
  end
end

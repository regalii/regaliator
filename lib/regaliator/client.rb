module Regaliator
  class Client
    attr_accessor :config

    def initialize(config = Regaliator.configuration)
      @config = config
    end
  end
end

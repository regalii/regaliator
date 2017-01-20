module Regaliator
  class APIVersionError < StandardError
    def initialize(api_version)
      super("API version `#{api_version}' isn't supported!")
    end
  end
end

require 'regaliator/configuration'
require 'regaliator/api_version_error'
require 'regaliator/v30'

module Regaliator
  API_VERSIONS = [V30].each_with_object({}) { |version, hsh|
    hsh[version::API_VERSION] = version
  }.freeze

  class << self
    def new(config = nil)
      config ||= Configuration.new
      yield(config) if block_given?

      if config && API_VERSIONS.key?(config.version)
        Kernel.const_get("#{API_VERSIONS[config.version]}::Client").new(config)
      else
        raise APIVersionError.new(config.version)
      end
    end
  end
end

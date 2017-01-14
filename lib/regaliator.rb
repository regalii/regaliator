require 'regaliator/configuration'
require 'regaliator/api_version_error'
require 'regaliator/v15'
require 'regaliator/v30'

module Regaliator
  API_VERSIONS = [V15, V30].each_with_object({}) { |version, hsh|
    hsh[version::API_VERSION] = version
  }.freeze

  class << self
    def configuration
      @config ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def new(arg = nil)
      config = get_configuration(arg)
      yield(config) if block_given?

      if API_VERSIONS.key?(config.version)
        Kernel.const_get("#{API_VERSIONS[config.version]}::Client").new(config)
      else
        raise APIVersionError.new(config.version)
      end
    end

    private

    def get_configuration(arg)
      return arg if arg.is_a?(Configuration)

      if arg.is_a?(Hash)
        configuration.dup.tap do |config|
          arg.each do |key, value|
            config.send("#{key}=", value) if config.respond_to?("#{key}=")
          end
        end
      else
        configuration
      end
    end
  end
end

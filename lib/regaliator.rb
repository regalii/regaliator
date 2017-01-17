require 'regaliator/configuration'
require 'regaliator/api_version_error'
require 'regaliator/v15'
require 'regaliator/v30'
require 'regaliator/v31'

module Regaliator
  API_VERSIONS = {
    V15::API_VERSION => V15::Client,
    V30::API_VERSION => V30::Client,
    V31::API_VERSION => V31::Client
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

      unless API_VERSIONS.key?(config.version)
        raise APIVersionError.new(config.version)
      end

      API_VERSIONS[config.version].new(config)
    end

    def method_missing(method_name, *args)
      client = new
      if client.respond_to?(method_name)
        client.send(method_name, *args)
      else
        super
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

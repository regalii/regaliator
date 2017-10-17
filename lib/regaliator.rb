require 'regaliator/configuration'
require 'regaliator/client'

module Regaliator
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

      Client.new(config)
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

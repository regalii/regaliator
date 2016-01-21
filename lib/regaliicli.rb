require "json"
require 'base64'
require "regaliicli/version"
require "regaliicli/configuration"
require "regaliicli/request"
require "regaliicli/response"
require "regaliicli/endpoint"
require "regaliicli/endpoint/account"
require "regaliicli/endpoint/bill"
require "regaliicli/endpoint/biller"
require "regaliicli/endpoint/rate"
require "regaliicli/endpoint/subscription"
require "regaliicli/endpoint/transaction"

module RegaliiCli
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end

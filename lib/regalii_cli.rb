require "json"
require 'base64'
require "regalii_cli/version"
require "regalii_cli/configuration"
require "regalii_cli/request"
require "regalii_cli/response"
require "regalii_cli/endpoint"
require "regalii_cli/endpoint/account"
require "regalii_cli/endpoint/bill"
require "regalii_cli/endpoint/biller"
require "regalii_cli/endpoint/rate"
require "regalii_cli/endpoint/subscription"
require "regalii_cli/endpoint/transaction"

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

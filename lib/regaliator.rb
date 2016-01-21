require "json"
require 'base64'
require "regaliator/version"
require "regaliator/configuration"
require "regaliator/request"
require "regaliator/response"
require "regaliator/endpoint"
require "regaliator/endpoint/account"
require "regaliator/endpoint/bill"
require "regaliator/endpoint/biller"
require "regaliator/endpoint/rate"
require "regaliator/endpoint/transaction"

module Regaliator
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

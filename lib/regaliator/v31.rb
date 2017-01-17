require 'regaliator/v30/client'

module Regaliator
  module V31
    API_VERSION = '3.1'.freeze

    Client      = V30::Client
    Account     = V30::Account
    Bill        = V30::Bill
    Biller      = V30::Biller
    Rate        = V30::Rate
    Transaction = V30::Transaction
  end
end

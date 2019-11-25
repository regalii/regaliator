require 'regaliator/v15/client'

module Regaliator
  module V16
    API_VERSION = '1.6'.freeze

    Client      = V15::Client
    Account     = V15::Account
    Bill        = V15::Bill
    Biller      = V15::Biller
    Rate        = V15::Rate
    Transaction = V15::Transaction
  end
end

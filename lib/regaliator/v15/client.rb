require 'regaliator/client'
require 'regaliator/v15/bill'

module Regaliator
  module V15
    class Client < Client
      def bill
        Bill.new(config)
      end
    end
  end
end

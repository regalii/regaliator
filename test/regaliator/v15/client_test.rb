require 'test_helper'

module Regaliator
  module V15
    class ClientTest < Minitest::Test
      def setup
        @config  = Configuration.new
        @subject = Client.new(@config)
      end

      def test_versioned_client_inherits_from_client
        assert_operator V15::Client, :<, Regaliator::Client
      end

      %i(bill).each do |endpoint|
        define_method("test_#{endpoint}_method_returns_#{endpoint}_instance") do
          klass = "::Regaliator::V15::#{endpoint.capitalize}"
          assert_instance_of Kernel.const_get(klass), @subject.send(endpoint)
        end
      end
    end
  end
end

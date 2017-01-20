require 'test_helper'

module Regaliator
  module V31
    class ClientTest < Minitest::Test
      def setup
        @config  = Configuration.new
        @subject = Client.new(@config)
      end

      def test_versioned_client_inherits_from_client
        assert_operator V31::Client, :<, Regaliator::Client
      end

      %i(account bill biller rate transaction).each do |endpoint|
        define_method("test_#{endpoint}_method_returns_#{endpoint}_instance") do
          klass = "::Regaliator::V31::#{endpoint.capitalize}"
          assert_instance_of Kernel.const_get(klass), @subject.send(endpoint)
        end
      end
    end
  end
end

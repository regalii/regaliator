require 'test_helper'

module Regaliator
  class ClientTest < Minitest::Test
    def setup
      @config  = Configuration.new
      @subject = Client.new(@config)
    end

    def test_constructor_accepts_a_configuration
      subject = Client.new(@config)

      assert_same @config, subject.config
    end

    %i[account bill biller rate transaction].each do |endpoint|
      define_method("test_#{endpoint}_method_returns_#{endpoint}_instance") do
        klass = "::Regaliator::#{endpoint.capitalize}"
        assert_instance_of Kernel.const_get(klass), @subject.send(endpoint)
      end
    end
  end
end

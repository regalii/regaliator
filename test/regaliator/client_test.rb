require 'test_helper'

module Regaliator
  class ClientTest < Minitest::Test
    def setup
      @config = Configuration.new.tap do |config|
        config.host       = 'https://api.regalii.dev'
        config.api_key    = 'api_key'
        config.secret_key = 'secret_key'
      end
    end

    def test_constructor_accepts_a_configuration
      subject = Client.new(@config)

      assert_same @config, subject.config
    end
  end
end

require 'test_helper'

class RegaliatorTest < Test::Unit::TestCase
  def teardown
    Regaliator.configuration = nil
  end

  def test_configure_sets_values_for_settings
    Regaliator.configure do |config|
      config.api_key      = '123'
      config.secret_key   = '321'
      config.host         = 'api.example.com'
      config.open_timeout = 10
      config.use_ssl      = false
    end

    assert_equal '123', Regaliator.configuration.api_key
    assert_equal '321', Regaliator.configuration.secret_key
    assert_equal 'api.example.com', Regaliator.configuration.host
    assert_equal 10, Regaliator.configuration.open_timeout
    assert !Regaliator.configuration.use_ssl
  end
end

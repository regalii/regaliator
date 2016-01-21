require 'test_helper'

class RegaliiCliTest < Test::Unit::TestCase
  def teardown
    RegaliiCli.configuration = nil
  end

  def test_configure_sets_values_for_settings
    RegaliiCli.configure do |config|
      config.api_key      = '123'
      config.secret_key   = '321'
      config.host         = 'api.example.com'
      config.open_timeout = 10
      config.use_ssl      = false
    end

    assert_equal '123', RegaliiCli.configuration.api_key
    assert_equal '321', RegaliiCli.configuration.secret_key
    assert_equal 'api.example.com', RegaliiCli.configuration.host
    assert_equal 10, RegaliiCli.configuration.open_timeout
    assert !RegaliiCli.configuration.use_ssl
  end
end

require 'test_helper'

class Regaliator::ConfigurationTest < Minitest::Test
  def teardown
    Regaliator.configuration = nil
  end

  # config.api_key
  def test_config_api_key_defaults_to_nil
    assert_nil Regaliator.configuration.api_key
  end

  def test_sets_config_api_key_using_configure
    Regaliator.configure do |config|
      config.api_key = '123'
    end

    assert_equal '123', Regaliator.configuration.api_key
  end

  # config.secret_key
  def test_config_secret_key_defaults_to_nil
    assert_nil Regaliator.configuration.secret_key
  end

  def test_sets_config_secret_key_using_configure
    Regaliator.configure do |config|
      config.secret_key = '321'
    end

    assert_equal '321', Regaliator.configuration.secret_key
  end

  # config.host
  def test_config_host_defaults_to_nil
    assert_nil Regaliator.configuration.host
  end

  def test_sets_config_host
    Regaliator.configure do |config|
      config.host = 'api.example.com'
    end

    assert_equal 'api.example.com', Regaliator.configuration.host
  end

  # config.version
  def test_config_version_defaults_to_api_version
    assert_equal Regaliator::API_VERSION, Regaliator.configuration.version
  end

  def test_cannot_override_config_version
    assert_raises NoMethodError do
      Regaliator.configure do |config|
        config.version = '2.0'
      end
    end
  end

  # config.open_timeout
  def test_config_open_timeout_defaults_to_10
    assert_equal 10, Regaliator.configuration.open_timeout
  end

  def test_sets_config_open_timeout
    Regaliator.configure do |config|
      config.open_timeout = 10
    end

    assert_equal 10, Regaliator.configuration.open_timeout
  end

  # config.read_timeout
  def test_config_read_timeout_defaults_to_10
    assert_equal 10, Regaliator.configuration.open_timeout
  end

  def test_sets_config_read_timeout
    Regaliator.configure do |config|
      config.read_timeout = 10
    end

    assert_equal 10, Regaliator.configuration.read_timeout
  end

  # config.use_ssl
  def test_config_use_ssl_defaults_to_true
    assert Regaliator.configuration.use_ssl
    assert Regaliator.configuration.secure?
  end

  def test_sets_config_use_ssl
    Regaliator.configure do |config|
      config.use_ssl = false
    end

    assert !Regaliator.configuration.secure?
    assert !Regaliator.configuration.use_ssl
  end

  # config.proxy_host, config.proxy_port, config.proxy_user, config.proxy_pass
  def test_config_proxy_defaults_to_nil
    assert_nil Regaliator.configuration.proxy_host
    assert_nil Regaliator.configuration.proxy_port
    assert_nil Regaliator.configuration.proxy_user
    assert_nil Regaliator.configuration.proxy_pass
  end

  def test_sets_config_proxy
    Regaliator.configure do |config|
      config.proxy_host = 'localhost'
      config.proxy_port = '9293'
      config.proxy_user = 'username'
      config.proxy_pass = 'password'
    end

    assert_equal 'localhost', Regaliator.configuration.proxy_host
    assert_equal '9293',      Regaliator.configuration.proxy_port
    assert_equal 'username',  Regaliator.configuration.proxy_user
    assert_equal 'password',  Regaliator.configuration.proxy_pass
  end
end

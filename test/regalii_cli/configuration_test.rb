require 'test_helper'

class RegaliiCli::ConfigurationTest < Test::Unit::TestCase
  def teardown
    RegaliiCli.configuration = nil
  end

  # config.api_key
  def test_config_api_key_defaults_to_nil
    assert_nil RegaliiCli.configuration.api_key
  end

  def test_sets_config_api_key_using_configure
    RegaliiCli.configure do |config|
      config.api_key = '123'
    end

    assert_equal '123', RegaliiCli.configuration.api_key
  end

  # config.secret_key
  def test_config_secret_key_defaults_to_nil
    assert_nil RegaliiCli.configuration.secret_key
  end

  def test_sets_config_secret_key_using_configure
    RegaliiCli.configure do |config|
      config.secret_key = '321'
    end

    assert_equal '321', RegaliiCli.configuration.secret_key
  end

  # config.host
  def test_config_host_defaults_to_nil
    assert_nil RegaliiCli.configuration.host
  end

  def test_sets_config_host
    RegaliiCli.configure do |config|
      config.host = 'api.example.com'
    end

    assert_equal 'api.example.com', RegaliiCli.configuration.host
  end

  # config.version
  def test_config_version_defaults_to_api_version
    assert_equal RegaliiCli::API_VERSION, RegaliiCli.configuration.version
  end

  def test_cannot_override_config_version
    assert_raise NoMethodError do
      RegaliiCli.configure do |config|
        config.version = '2.0'
      end
    end
  end

  # config.open_timeout
  def test_config_open_timeout_defaults_to_10
    assert_equal 10, RegaliiCli.configuration.open_timeout
  end

  def test_sets_config_open_timeout
    RegaliiCli.configure do |config|
      config.open_timeout = 10
    end

    assert_equal 10, RegaliiCli.configuration.open_timeout
  end

  # config.read_timeout
  def test_config_read_timeout_defaults_to_10
    assert_equal 10, RegaliiCli.configuration.open_timeout
  end

  def test_sets_config_read_timeout
    RegaliiCli.configure do |config|
      config.read_timeout = 10
    end

    assert_equal 10, RegaliiCli.configuration.read_timeout
  end

  # config.use_ssl
  def test_config_use_ssl_defaults_to_true
    assert RegaliiCli.configuration.use_ssl
    assert RegaliiCli.configuration.secure?
  end

  def test_sets_config_use_ssl
    RegaliiCli.configure do |config|
      config.use_ssl = false
    end

    assert !RegaliiCli.configuration.secure?
    assert !RegaliiCli.configuration.use_ssl
  end

  # config.proxy_host, config.proxy_port, config.proxy_user, config.proxy_pass
  def test_config_proxy_defaults_to_nil
    assert_nil RegaliiCli.configuration.proxy_host
    assert_nil RegaliiCli.configuration.proxy_port
    assert_nil RegaliiCli.configuration.proxy_user
    assert_nil RegaliiCli.configuration.proxy_pass
  end

  def test_sets_config_proxy
    RegaliiCli.configure do |config|
      config.proxy_host = 'localhost'
      config.proxy_port = '9293'
      config.proxy_user = 'username'
      config.proxy_pass = 'password'
    end

    assert_equal 'localhost', RegaliiCli.configuration.proxy_host
    assert_equal '9293',      RegaliiCli.configuration.proxy_port
    assert_equal 'username',  RegaliiCli.configuration.proxy_user
    assert_equal 'password',  RegaliiCli.configuration.proxy_pass
  end
end

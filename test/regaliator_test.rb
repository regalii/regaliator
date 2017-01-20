require 'test_helper'

class RegaliatorTest < Minitest::Test
  def test_api_versions_constant_is_defined
    assert Regaliator.const_defined?(:API_VERSIONS)
  end

  def test_api_versions_has_good_format
    Regaliator::API_VERSIONS.each do |version, client|
      assert_instance_of String, version
      assert_instance_of Class, client
    end
  end

  def test_configuration_has_default_instance
    assert_instance_of Regaliator::Configuration, Regaliator.configuration
    assert_same Regaliator.configuration, Regaliator.configuration
  end

  def test_configuration_can_be_overrided
    subject = Regaliator.configuration
    Regaliator.configure { |config| config.host = 'https://myhost' }
    assert_equal 'https://myhost', subject.host
  end

  def test_new_method_accepts_several_types
    Regaliator.configure do |config|
      config.version    = '3.0'
      config.host       = 'api.regalii.dev'
      config.api_key    = 'testing'
      config.secret_key = 'testing'
    end
    assert_same Regaliator.configuration, Regaliator.new.config

    config = Regaliator::Configuration.new.tap do |config|
      config.version    = '1.5'
      config.host       = 'api.regalii.dev'
      config.api_key    = 'testing'
      config.secret_key = 'testing'
    end
    subject = Regaliator.new(config)
    assert_same config, subject.config
    assert_equal '1.5', subject.config.version

    subject = Regaliator.new(version: '1.5')
    refute_same Regaliator.configuration, subject.config
    assert_equal '1.5', subject.config.version
    assert_equal '3.0', Regaliator.new.config.version
  end

  def test_module_handles_endpoints_directly
    client_methods = Regaliator::Client.public_instance_methods

    Regaliator::API_VERSIONS.each do |version, client|
      Regaliator.configure { |config| config.version = version }
      module_version = Regaliator.const_get("#{client.to_s.split('::')[1]}")

      (client.public_instance_methods - client_methods).each do |method|
        klass = module_version.const_get(method.to_s.capitalize)
        assert_instance_of klass, Regaliator.send(method)
      end
    end

    Regaliator.configure { |config| config.version = nil }
  end
end

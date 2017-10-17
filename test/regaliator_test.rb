require 'test_helper'

class RegaliatorTest < Minitest::Test
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
      config.host       = 'api.regalii.dev'
      config.api_key    = 'testing'
      config.secret_key = 'testing'
    end
    assert_same Regaliator.configuration, Regaliator.new.config

    config = Regaliator::Configuration.new.tap do |config|
      config.host       = 'api.regalii.dev'
      config.api_key    = 'testing'
      config.secret_key = 'testing'
    end
    subject = Regaliator.new(config)
    assert_same config, subject.config
  end
end

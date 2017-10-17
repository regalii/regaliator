require 'test_helper'

module Regaliator
  class ConfigurationTest < Minitest::Test
    def setup
      @subject = Configuration.new
    end

    def test_api_key_attribute_has_default_value
      assert_nil @subject.api_key
    end

    def test_secret_key_attribute_has_default_value
      assert_nil @subject.secret_key
    end

    def test_host_attribute_has_default_value
      assert_nil @subject.host
    end

    def test_open_timeout_attribute_has_default_value
      assert_instance_of Fixnum, @subject.open_timeout
    end

    def test_read_timeout_attribute_has_default_value
      assert_instance_of Fixnum, @subject.read_timeout
    end

    def test_use_ssl_attribute_has_default_value
      assert_instance_of TrueClass, @subject.use_ssl
    end

    def test_proxy_host_attribute_has_default_value
      assert_nil @subject.proxy_host
    end

    def test_proxy_port_attribute_has_default_value
      assert_nil @subject.proxy_port
    end

    def test_proxy_user_attribute_has_default_value
      assert_nil @subject.proxy_user
    end

    def test_proxy_pass_attribute_has_default_value
      assert_nil @subject.proxy_pass
    end

    def test_api_key_attribute_has_writter
      subject = Configuration.new.tap { |c| c.api_key = '123' }
      assert_equal '123', subject.api_key
    end

    def test_secret_key_attribute_has_writter
      subject = Configuration.new.tap { |c| c.secret_key = '321' }
      assert_equal '321', subject.secret_key
    end

    def test_host_attribute_has_writter
      subject = Configuration.new.tap { |c| c.host = 'api.example.com' }
      assert_equal 'api.example.com', subject.host
    end

    def test_open_timeout_attribute_has_writter
      subject = Configuration.new.tap { |c| c.open_timeout = 10 }
      assert_equal 10, subject.open_timeout
    end

    def test_read_timeout_attribute_has_writter
      subject = Configuration.new.tap { |c| c.read_timeout = 10 }
      assert_equal 10, subject.read_timeout
    end

    def test_use_ssl_attribute_has_writter
      subject = Configuration.new.tap { |c| c.use_ssl = false }
      assert_equal false, subject.use_ssl
    end

    def test_proxy_host_attribute_has_writter
      subject = Configuration.new.tap { |c| c.proxy_host = 'localhost' }
      assert_equal 'localhost', subject.proxy_host
    end

    def test_proxy_port_attribute_has_writter
      subject = Configuration.new.tap { |c| c.proxy_port = '9293' }
      assert_equal '9293', subject.proxy_port
    end

    def test_proxy_user_attribute_has_writter
      subject = Configuration.new.tap { |c| c.proxy_user = 'username' }
      assert_equal 'username', subject.proxy_user
    end

    def test_proxy_pass_attribute_has_writter
      subject = Configuration.new.tap { |c| c.proxy_pass = 'password' }
      assert_equal 'password', subject.proxy_pass
    end

    def test_secure_method_returns_boolean
      assert_equal true, Configuration.new.tap { |c| c.use_ssl = true }.secure?
      assert_equal false, Configuration.new.tap { |c| c.use_ssl = 'hello' }.secure?
      assert_equal false, Configuration.new.tap { |c| c.use_ssl = false }.secure?
      assert_equal false, Configuration.new.tap { |c| c.use_ssl = nil }.secure?
    end
  end
end

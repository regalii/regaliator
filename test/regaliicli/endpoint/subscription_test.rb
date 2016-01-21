require 'test_helper'

class RegaliiCli::SubscriptionTest < Test::Unit::TestCase
  def setup
    RegaliiCli.configure do |config|
      config.api_key    = 'api-key'
      config.secret_key = 'secret-key'
      config.host       = 'api.regalii.dev'
      config.use_ssl    = false
    end
  end

  def test_create
    VCR.use_cassette('subscription/create') do
      response = RegaliiCli::Subscription.create(biller_id: 6234, login: 'testlogin', password: 'supersecret')

      assert response.success?

      hash = {
        "id"              => 187,
        "login"           => "testlogin",
        "balance"         => nil,
        "due_date"        => nil,
        "account_number"  => nil,
        "name_on_account" => nil,
        "callback_url"    => nil,
        "is_running"      => true,
        "error"           => nil,
        "has_error"       => false,
        "created_at"      => "2015-12-22T19:06:39.802Z",
        "updated_at"      => "2015-12-22T19:06:39.820Z"
      }

      assert_equal hash, response.data
    end
  end

  def test_consult
    VCR.use_cassette('subscription/consult') do
      response = RegaliiCli::Subscription.consult(id: 187)

      assert response.success?

      hash = {
        "id"              => 187,
        "login"           => "testlogin",
        "balance"         => 36.98,
        "due_date"        => "2015-12-22",
        "account_number"  => "38517298",
        "name_on_account" => "Ms. Sarina Weber",
        "callback_url"    => nil,
        "is_running"      => false,
        "error"           => nil,
        "has_error"       => false,
        "created_at"      => "2015-12-22T19:06:39.000Z",
        "updated_at"      => "2015-12-22T19:06:41.000Z"
      }

      assert_equal hash, response.data
    end
  end

  def test_update
    VCR.use_cassette('subscription/update') do
      response = RegaliiCli::Subscription.update(id: 187, login: 'newtestlogin')

      assert response.success?

      hash = {
        "id"              => 187,
        "login"           => "newtestlogin",
        "balance"         => nil,
        "due_date"        => nil,
        "account_number"  => "38517298",
        "name_on_account" => "Ms. Sarina Weber",
        "callback_url"    => nil,
        "is_running"      => true,
        "error"           => nil,
        "has_error"       => false,
        "created_at"      => "2015-12-22T19:06:39.000Z",
        "updated_at"      => "2015-12-22T19:11:34.859Z"
      }

      assert_equal hash, response.data
    end
  end

  def test_refresh
    VCR.use_cassette('subscription/refresh') do
      response = RegaliiCli::Subscription.refresh(id: 187)

      assert response.success?

      hash = {
        "id"              => 187,
        "login"           => "newtestlogin",
        "balance"         => nil,
        "due_date"        => nil,
        "account_number"  => "38517298",
        "name_on_account" => "Ms. Sarina Weber",
        "callback_url"    => nil,
        "is_running"      => true,
        "error"           => nil,
        "has_error"       => false,
        "created_at"      => "2015-12-22T19:06:39.000Z",
        "updated_at"      => "2015-12-22T19:13:29.792Z"
      }

      assert_equal hash, response.data
    end
  end
end

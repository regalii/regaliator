require 'test_helper'

class Regaliator::AccountTest < Test::Unit::TestCase
  def test_successful_info
    Regaliator.configure do |config|
      config.api_key    = 'api-key'
      config.secret_key = 'secret-key'
      config.host       = 'api.regalii.dev'
      config.use_ssl    = false
    end

    VCR.use_cassette('account/successful_info') do
      response = Regaliator::Account.info

      assert response.success?

      hash = {
        "name"            => "ABC Ltd",
        "balance"         => 20000.0,
        "minimum_balance" => -2000.0,
        "currency"        => "USD"
      }

      assert_equal hash, response.data
    end
  end

  def test_failed_info
    Regaliator.configure do |config|
      config.api_key    = 'api-key'
      config.secret_key = 'bogus'
      config.host       = 'api.regalii.dev'
      config.use_ssl    = false
    end

    VCR.use_cassette('account/failed_info') do
      response = Regaliator::Account.info

      assert !response.success?

      hash = {"message" => "Unauthorized"}

      assert_equal hash, response.data
    end
  end
end

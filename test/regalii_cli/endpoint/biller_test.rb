require 'test_helper'

class RegaliiCli::BillerTest < Test::Unit::TestCase
  def setup
    RegaliiCli.configure do |config|
      config.api_key    = 'api-key'
      config.secret_key = 'secret-key'
      config.host       = 'api.regalii.dev'
      config.use_ssl    = false
    end
  end

  def test_list
    VCR.use_cassette('biller/list') do
      response = RegaliiCli::Biller.list

      assert response.success?

      hash = {
        "billers" => [
          {
            "id"                        => 3261,
            "name"                      => "Adani Energy Limited",
            "country"                   => "India",
            "biller_type"               => "Gas",
            "can_check_balance"         => false,
            "supports_partial_payments" => true,
            "requires_name_on_account"  => false,
            "available_topup_amounts"   => nil,
            "hours_to_fulfill"          => 0,
            "local_currency"            => "INR",
            "account_number_digits"     => "10",
            "mask"                      => "9999999999",
            "bill_type"                 => "account_number",
            "country_iso"               => "IN",
            "currency_iso"              => "INR"
          }
        ]
      }

      assert_equal hash, response.data
    end
  end
end

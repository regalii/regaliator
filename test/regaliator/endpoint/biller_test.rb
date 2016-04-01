require 'test_helper'

class Regaliator::BillerTest < Minitest::Test
  def setup
    Regaliator.configure do |config|
      config.api_key    = 'api-key'
      config.secret_key = 'secret-key'
      config.host       = 'api.regalii.dev'
      config.use_ssl    = false
    end
  end

  def test_list_credentials
    VCR.use_cassette('biller/credentials') do
      response = Regaliator::Biller.credentials

      assert response.success?

      hash = {
        "billers" => [
          {"id"=>6330, "name"=>"Adobe Creative Cloud", "country"=>"US", "currency"=>"", "biller_type"=>"Media", "bill_type"=>"credentials", "required_parameters"=>nil, "returned_parameters"=>nil}
        ]
      }

      assert_equal hash, response.data
    end
  end

  def test_list_topups
    VCR.use_cassette('biller/topups') do
      response = Regaliator::Biller.topups

      assert response.success?

      hash = {
        "billers" => [
          {"id"=>4842, "name"=>"Alegro", "country"=>"EC", "currency"=>"USD", "biller_type"=>"Cell", "bill_type"=>"phone_number", "available_topup_amounts"=>["6.00", "12.00"], "topup_fxrate"=>nil, "mask"=>nil, "topup_commission"=>11.0, "account_number_digits"=>"8"}
        ]
      }

      assert_equal hash, response.data
    end
  end

  def test_list_utilities
    VCR.use_cassette('biller/utilities') do
      response = Regaliator::Biller.utilities

      assert response.success?

      hash = {
        "billers" => [
          {"id"=>3261, "name"=>"Adani Energy Limited", "country"=>"IN", "currency"=>"INR", "biller_type"=>"Gas", "bill_type"=>"account_number", "can_check_balance"=>false, "mask"=>"9999999999", "requires_name_on_account"=>false, "supports_partial_payments"=>true, "hours_to_fulfill"=>0, "account_number_digits"=>"10"}
        ]
      }

      assert_equal hash, response.data
    end
  end
end

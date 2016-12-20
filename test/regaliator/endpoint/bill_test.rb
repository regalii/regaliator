require 'test_helper'

class Regaliator::BillTest < Minitest::Test
  def setup
    Regaliator.configure do |config|
      config.api_key    = 'api-key'
      config.secret_key = 'secret-key'
      config.host       = 'api.regalii.dev'
      config.use_ssl    = false
    end
  end

  def test_create
    VCR.use_cassette('bill/create') do
      response = Regaliator::Bill.create(biller_id: 2, account_number: '8081969')

      assert response.success?

      hash = {
        "id"=>5,
        "biller_id"=>2,
        "account_number"=>"8081969",
        "name_on_account"=>nil,
        "due_date"=>nil,
        "balance"=>203.0,
        "balance_currency"=>"RD",
        "balance_in_chain_currency"=>4.64,
        "balance_updated_at"=>"2016-03-22T21:32:36Z",
        "created_at"=>"2016-03-22T21:32:36Z",
        "last_paid_at"=>nil,
        "error_with_account"=>false,
        "error_message"=>nil,
        "status"=>"updated",
        "mfa_challenges"=>[]
      }

      assert_equal hash, response.data
    end
  end

  def test_update
    VCR.use_cassette('bill/update') do
      response = Regaliator::Bill.update(5, name_on_account: 'Test name')

      assert response.success?

      hash = {
        "id"=>5,
        "biller_id"=>2,
        "account_number"=>"8081969",
        "name_on_account"=>"Test name",
        "due_date"=>nil,
        "balance"=>44.0,
        "balance_currency"=>"RD",
        "balance_in_chain_currency"=>1.01,
        "balance_updated_at"=>"2016-03-22T21:38:08Z",
        "created_at"=>"2016-03-22T21:32:36Z",
        "last_paid_at"=>nil,
        "error_with_account"=>false,
        "error_message"=>nil,
        "status"=>"updated",
        "mfa_challenges"=>[]
      }

      assert_equal hash, response.data
    end
  end

  def test_show
    VCR.use_cassette('bill/show') do
      response = Regaliator::Bill.show(5)

      assert response.success?

      hash = {
        "id"=>5,
        "biller_id"=>2,
        "account_number"=>"8081969",
        "name_on_account"=>"Test name",
        "due_date"=>nil,
        "balance"=>44.0,
        "balance_currency"=>"RD",
        "balance_in_chain_currency"=>1.01,
        "balance_updated_at"=>"2016-03-22T21:38:08Z",
        "created_at"=>"2016-03-22T21:32:36Z",
        "last_paid_at"=>nil,
        "error_with_account"=>false,
        "error_message"=>nil,
        "status"=>"updated",
        "mfa_challenges"=>[]
      }

      assert_equal hash, response.data
    end
  end

  def test_xdata
    VCR.use_cassette('bill/xdata') do
      response = Regaliator::Bill.xdata(674101)

      assert response.success?

      hash = {
        "id"=>674101,
        "biller_id"=>6503,
        "account_number"=>"12345",
        "name_on_account"=>"Kelly Gruber",
        "due_date"=>"2016-10-10",
        "balance"=>10.5,
        "balance_currency"=>"USD",
        "balance_updated_at"=>"2016-08-03T18:35:21Z",
        "created_at"=>"2016-06-14T20:57:08Z",
        "status"=>"updated",
        "address"=>nil,
        "payment_method"=>nil,
        "statements"=>[],
        "subordinates"=>[]
      }

      assert_equal hash, response.data
    end
  end

  def test_refresh
    VCR.use_cassette('bill/refresh') do
      response = Regaliator::Bill.refresh(5)

      assert response.success?

      hash = {
        "id"=>5,
        "biller_id"=>2,
        "account_number"=>"8081969",
        "name_on_account"=>nil,
        "due_date"=>nil,
        "balance"=>44.0,
        "balance_currency"=>"RD",
        "balance_in_chain_currency"=>1.01,
        "balance_updated_at"=>"2016-03-22T21:38:08Z",
        "created_at"=>"2016-03-22T21:32:36Z",
        "last_paid_at"=>nil,
        "error_with_account"=>false,
        "error_message"=>nil,
        "status"=>"updated",
        "mfa_challenges"=>[]
      }

      assert_equal hash, response.data
    end
  end

  def test_pay
    VCR.use_cassette('bill/pay') do
      response = Regaliator::Bill.pay(5, amount: 758.0, currency: 'RD')

      assert response.success?

      hash = {
        "id"=>23,
        "external_id"=>nil,
        "biller_id"=>2,
        "account_number"=>"8081969",
        "bill_amount"=>758.0,
        "bill_amount_currency"=>"RD",
        "fx_rate"=>43.7165,
        "bill_amount_usd"=>17.34,
        "bill_amount_chain_currency"=>17.34,
        "payment_transaction_fee"=>3.0,
        "payment_total_usd"=>20.34,
        "payment_total_chain_currency"=>20.34,
        "chain_earned"=>0.0,
        "chain_paid"=>20.34,
        "starting_balance"=>-101.2,
        "ending_balance"=>-121.54,
        "hours_to_fulfill"=>0,
        "discount"=>0.0,
        "sms_text"=>nil,
        "created_at"=>"2016-03-22T21:42:57Z",
        "payment_status"=>"sent",
        "bill_amount_local_currency"=>758.0,
        "local_currency"=>"RD"
      }

      assert_equal hash, response.data
    end
  end

  def test_list
    VCR.use_cassette('bills') do
      response = Regaliator::Bill.list

      assert response.success?

      # TODO add stubbed response from VCR from api.regalii.dev
    end
  end
end

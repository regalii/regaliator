require 'test_helper'

class RegaliiCli::ClientTest < Test::Unit::TestCase
  # def setup
  #   RegaliiCli.configure do |config|
  #     config.api_key    = 'api-key'
  #     config.secret_key = 'secret-key'
  #     config.host       = 'api.regalii.dev'
  #     config.use_ssl    = false
  #   end
  # end
  #
  # def test_successful_bill_consult
  #   VCR.use_cassette('successful_bill_consult') do
  #     response = RegaliiCli::Client.bill_consult(biller_id: 1, account_number: '1234567')
  #
  #     assert response.success?
  #
  #     hash = {
  #       "account_number"          => "1234567",
  #       "biller_id"               => 1,
  #       "bill_amount"             => 399.0,
  #       "bill_amount_currency"    => "RD",
  #       "fx_rate"                 => 44.0246,
  #       "bill_amount_usd"         => 9.06,
  #       "payment_transaction_fee" => 3.0,
  #       "payment_total_usd"       => 12.06,
  #       "invoice_number"          => nil,
  #       "invoice_date"            => nil,
  #       "name_on_account"         => nil
  #     }
  #
  #     assert_equal hash, response.data
  #   end
  # end
  #
  # def test_failed_bill_consult
  #   VCR.use_cassette('failed_bill_consult') do
  #     response = RegaliiCli::Client.bill_consult(biller_id: 1, account_number: '123456')
  #
  #     assert !response.success?
  #
  #     hash = {"code"=>"R2", "message"=>"Invalid Account Number"}
  #
  #     assert_equal hash, response.data
  #   end
  # end
  #
  # def test_successful_bill_pay
  #   VCR.use_cassette('successful_bill_pay') do
  #     response = RegaliiCli::Client.bill_pay(biller_id: 1, account_number: '1234567', amount: 411.0, currency: 'RD', user_id: 9)
  #
  #     assert response.success?
  #
  #     hash = {
  #       "id"                      => 8,
  #       "external_id"             => nil,
  #       "biller_id"               => 1,
  #       "account_number"          => "1234567",
  #       "bill_amount"             => 411.0,
  #       "bill_amount_currency"    => "RD",
  #       "fx_rate"                 => 44.0246,
  #       "bill_amount_usd"         => 9.34,
  #       "payment_transaction_fee" => 3.0,
  #       "payment_total_usd"       => 12.34,
  #       "chain_earned"            => 1.5,
  #       "chain_paid"              => 10.84,
  #       "starting_balance"        => -65.04,
  #       "ending_balance"          => -75.88,
  #       "hours_to_fulfill"        => 0,
  #       "discount"                => 0.0,
  #       "created_at"              => "2015-02-25T20:13:46.000Z"
  #     }
  #
  #     assert_equal hash, response.data
  #   end
  # end
  #
  # def test_failed_bill_pay
  #   VCR.use_cassette('failed_bill_pay') do
  #     response = RegaliiCli::Client.bill_pay(biller_id: 1, account_number: '1234567', amount: 0.0, currency: 'RD', user_id: 9)
  #
  #     assert !response.success?
  #
  #     hash = {
  #       "code"    => "R102",
  #       "message" => "Parameter cannot be less than 0.1: amount" }
  #
  #     assert_equal hash, response.data
  #   end
  # end
  #
  # def test_successful_transaction_reverse
  #   VCR.use_cassette('successful_transaction_reverse') do
  #     response = RegaliiCli::Client.transaction_reverse(id: 8)
  #
  #     assert response.success?
  #
  #     hash = {
  #       "code"    => "R0",
  #       "message" => "Transaction successful"
  #     }
  #
  #     assert_equal hash, response.data
  #   end
  # end
  #
  # def test_failed_transaction_reverse
  #   VCR.use_cassette('failed_transaction_reverse') do
  #     response = RegaliiCli::Client.transaction_reverse(id: 99)
  #
  #     assert !response.success?
  #
  #     hash = {
  #       "message" => "Not found"
  #     }
  #
  #     assert_equal hash, response.data
  #   end
  # end
  #
  # def test_successful_transaction_pay
  #   VCR.use_cassette('successful_transaction_pay') do
  #     response = RegaliiCli::Client.transaction_pay(id: 8)
  #
  #     assert response.success?
  #
  #     hash = {
  #       "code"    => "R0",
  #       "message" => "Transaction successful"
  #     }
  #
  #     assert_equal hash, response.data
  #   end
  # end
  #
  # def test_failed_transaction_pay
  #   VCR.use_cassette('failed_transaction_pay') do
  #     response = RegaliiCli::Client.transaction_pay(id: 99)
  #
  #     assert !response.success?
  #
  #     hash = {
  #       "message" => "Not found"
  #     }
  #
  #     assert_equal hash, response.data
  #   end
  # end
  #
  # def test_successful_subscription_create
  #   VCR.use_cassette('successful_subscription_create') do
  #     response = RegaliiCli::Client.subscription_create(biller_id: 2953, login: 'username', password: 'secret')
  #
  #     assert response.success?
  #
  #     hash = {
  #       "id"              => 2,
  #       "login"           => "username",
  #       "balance"         => nil,
  #       "due_date"        => nil,
  #       "created_at"      => "2015-06-30T21:18:49.748Z",
  #       "updated_at"      => "2015-06-30T21:18:49.748Z",
  #       "account_number"  => nil,
  #       "name_on_account" => nil
  #     }
  #     assert_equal hash, response.data
  #   end
  # end
  #
  # def test_successful_subscription_update
  #   VCR.use_cassette('successful_subscription_update') do
  #     response = RegaliiCli::Client.subscription_update(id: 33, login: 'newusername', password: 'secret')
  #
  #     assert response.success?
  #
  #     hash = {
  #       "id"              => 33,
  #       "login"           => "newusername",
  #       "balance"         => nil,
  #       "due_date"        => nil,
  #       "created_at"      => "2015-07-07T17:28:57.000Z",
  #       "updated_at"      => "2015-07-16T16:31:25.513Z",
  #       "account_number"  => nil,
  #       "name_on_account" => nil
  #     }
  #     assert_equal hash, response.data
  #   end
  # end
  #
  # def test_successful_subscription_consult
  #   VCR.use_cassette('successful_subscription_consult') do
  #     response = RegaliiCli::Client.subscription_consult(id: 2)
  #
  #     assert response.success?
  #
  #     hash = {
  #       "id"              => 2,
  #       "login"           => "username",
  #       "balance"         => 117.41,
  #       "due_date"        => nil,
  #       "created_at"      => "2015-06-30T21:18:49.000Z",
  #       "updated_at"      => "2015-06-30T21:19:38.000Z",
  #       "account_number"  => "484007205000078",
  #       "name_on_account" => "John Doe"
  #     }
  #
  #     assert_equal hash, response.data
  #   end
  # end
end

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
        "id"                          => 229,
        "biller_id"                   => 2,
        "account_number"              => "8081969",
        "name_on_account"             => nil,
        "due_date"                    => nil,
        "balance"                     => 365.0,
        "balance_currency"            => "RD",
        "balance_in_chain_currency"   => 8.54,
        "balance_updated_at"          => "2016-01-14T21:40:06Z",
        "created_at"                  => "2016-01-14T21:40:06Z",
        "last_paid_at"                => nil,
        "is_running"                  => false,
        "error_with_account"          => false,
        "error_message"               => nil,
        "secret_question"             => nil,
        "secret_answer"               => nil
      }

      assert_equal hash, response.data
    end
  end

  def test_update
    VCR.use_cassette('bill/update') do
      response = Regaliator::Bill.update(id: 229, name_on_account: 'Test name')

      assert response.success?

      hash = {
        "id"                          => 229,
        "biller_id"                   => 2,
        "account_number"              => "8081969",
        "name_on_account"             => 'Test name',
        "due_date"                    => nil,
        "balance"                     => 195.0,
        "balance_currency"            => "RD",
        "balance_in_chain_currency"   => 4.56,
        "balance_updated_at"          => "2016-01-14T22:27:40Z",
        "created_at"                  => "2016-01-14T21:40:06Z",
        "last_paid_at"                => nil,
        "is_running"                  => false,
        "error_with_account"          => false,
        "error_message"               => nil,
        "secret_question"             => nil,
        "secret_answer"               => nil
      }

      assert_equal hash, response.data
    end
  end

  def test_show
    VCR.use_cassette('bill/show') do
      response = Regaliator::Bill.show(id: 229)

      assert response.success?

      hash = {
        "id"                          => 229,
        "biller_id"                   => 2,
        "account_number"              => "8081969",
        "name_on_account"             => 'Test name',
        "due_date"                    => nil,
        "balance"                     => 195.0,
        "balance_currency"            => "RD",
        "balance_in_chain_currency"   => 4.56,
        "balance_updated_at"          => "2016-01-14T22:27:40Z",
        "created_at"                  => "2016-01-14T21:40:06Z",
        "last_paid_at"                => nil,
        "is_running"                  => false,
        "error_with_account"          => false,
        "error_message"               => nil,
        "secret_question"             => nil,
        "secret_answer"               => nil
      }

      assert_equal hash, response.data
    end
  end

  def test_refresh
    VCR.use_cassette('bill/refresh') do
      response = Regaliator::Bill.refresh(id: 229)

      assert response.success?

      hash = {
        "id"                          => 229,
        "biller_id"                   => 2,
        "account_number"              => "8081969",
        "name_on_account"             => nil,
        "due_date"                    => nil,
        "balance"                     => 24.0,
        "balance_currency"            => "RD",
        "balance_in_chain_currency"   => 0.56,
        "balance_updated_at"          => "2016-01-14T21:43:38Z",
        "created_at"                  => "2016-01-14T21:40:06Z",
        "last_paid_at"                => nil,
        "is_running"                  => false,
        "error_with_account"          => false,
        "error_message"               => nil,
        "secret_question"             => nil,
        "secret_answer"               => nil
      }

      assert_equal hash, response.data
    end
  end

  def test_pay
    VCR.use_cassette('bill/pay') do
      response = Regaliator::Bill.pay(id: 229, amount: 758.0, currency: 'RD', user_id: 3101)

      assert response.success?

      hash = {
        "id"                            => 20,
        "external_id"                   => nil,
        "biller_id"                     => 2,
        "account_number"                => "8081969",
        "bill_amount"                   => 758.0,
        "bill_amount_currency"          => "RD",
        "fx_rate"                       => 41.8686,
        "bill_amount_usd"               => 18.1,
        "bill_amount_chain_currency"    => 18.1,
        "payment_transaction_fee"       => 3.0,
        "payment_total_usd"             => 21.1,
        "payment_total_chain_currency"  => 21.1,
        "chain_earned"                  => 0.0,
        "chain_paid"                    => 21.1,
        "starting_balance"              => -134.64,
        "ending_balance"                => -155.74,
        "hours_to_fulfill"              => 0,
        "discount"                      => 0.0,
        "sms_text"                      => "Tu pago de Edenorte por $758.00RD se realizo con éxito! Ahora también puedes pagar tu factura de Edesur, Viva y Claro en tu tienda Regalii.",
        "created_at"                    => "2016-01-14T22:23:10Z",
        "payment_status"                => "sent"
      }

      assert_equal hash, response.data
    end
  end
end

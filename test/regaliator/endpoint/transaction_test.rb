require 'test_helper'

class Regaliator::TransactionTest < Minitest::Test
  def setup
    Regaliator.configure do |config|
      config.api_key    = 'api-key'
      config.secret_key = 'secret-key'
      config.host       = 'api.regalii.dev'
      config.use_ssl    = false
    end
  end

  def test_list
    VCR.use_cassette('transaction/list') do
      response = Regaliator::Transaction.list

      assert response.success?

      hash = {
        "transactions"=> [
          {
            "id"                          => 1,
            "external_id"                 => "1-1591-2222222233-201509302128",
            "biller_id"                   => 1591,
            "account_number"              => "2222222233",
            "bill_amount"                 => 2.0,
            "bill_amount_currency"        => "USD",
            "fx_rate"                     => 16.6048,
            "bill_amount_usd"             => 2.0,
            "bill_amount_chain_currency"  => 2.0,
            "payment_transaction_fee"     => 0.0,
            "payment_total_usd"           => 2.0,
            "payment_total_chain_currency"=> 2.0,
            "chain_earned"                => 0.5,
            "chain_paid"                  => 1.5,
            "starting_balance"            => -602.1,
            "ending_balance"              => -603.6,
            "hours_to_fulfill"            => 0,
            "discount"                    => 0.0,
            "sms_text"                    => "Tu pago de [Mexico] Telcel por $20.00MXN se realizo con éxito! Ahora también puedes pagar tu factura de CFE, Sky y Infonavit en tu tienda Regalii.",
            "created_at"                  => "2015-09-30T21:28:08.000Z",
            "payment_status"              => "sent"
          }
        ]
      }

      assert_equal hash, response.data
    end
  end

  def test_with_search
    VCR.use_cassette('transaction/search') do
      response = Regaliator::Transaction.list(q: { id_eq: 1})

      assert response.success?

      hash = {
        "transactions"=> [
          {
            "id"                          => 1,
            "external_id"                 => "1-1591-2222222233-201509302128",
            "biller_id"                   => 1591,
            "account_number"              => "2222222233",
            "bill_amount"                 => 2.0,
            "bill_amount_currency"        => "USD",
            "fx_rate"                     => 16.6048,
            "bill_amount_usd"             => 2.0,
            "bill_amount_chain_currency"  => 2.0,
            "payment_transaction_fee"     => 0.0,
            "payment_total_usd"           => 2.0,
            "payment_total_chain_currency"=> 2.0,
            "chain_earned"                => 0.5,
            "chain_paid"                  => 1.5,
            "starting_balance"            => -602.1,
            "ending_balance"              => -603.6,
            "hours_to_fulfill"            => 0,
            "discount"                    => 0.0,
            "sms_text"                    => "Tu pago de [Mexico] Telcel por $20.00MXN se realizo con éxito! Ahora también puedes pagar tu factura de CFE, Sky y Infonavit en tu tienda Regalii.",
            "created_at"                  => "2015-09-30T21:28:08.000Z",
            "payment_status"              => "sent"
          }
        ]
      }
      
      assert_equal hash, response.data
    end
  end
end

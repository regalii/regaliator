require 'test_helper'

class RegaliiCli::BillTest < Test::Unit::TestCase
  def setup
    RegaliiCli.configure do |config|
      config.api_key    = 'api-key'
      config.secret_key = 'secret-key'
      config.host       = 'api.regalii.dev'
      config.use_ssl    = false
    end
  end

  def test_consult
    VCR.use_cassette('bill/consult') do
      response = RegaliiCli::Bill.consult(biller_id: 1, account_number: '1234567')

      assert response.success?

      hash = {
        "account_number"                => "1234567",
        "biller_id"                     => 1,
        "bill_amount"                   => 758.0,
        "bill_amount_currency"          => "RD",
        "fx_rate"                       => 43.7105,
        "bill_amount_usd"               => 17.34,
        "bill_amount_chain_currency"    => 17.34,
        "payment_transaction_fee"       => 3.0,
        "payment_total_usd"             => 20.34,
        "payment_total_chain_currency"  => 20.34,
        "invoice_number"                => nil,
        "invoice_date"                  => nil,
        "name_on_account"               => nil
      }

      assert_equal hash, response.data
    end
  end

  def test_pay
    VCR.use_cassette('bill/pay') do
      response = RegaliiCli::Bill.pay(biller_id: 1, account_number: '1234567', amount: 758.0, currency: 'RD')

      assert response.success?

      hash = {
        "id"                            => 18,
        "external_id"                   => nil,
        "biller_id"                     => 1,
        "account_number"                => "1234567",
        "bill_amount"                   => 758.0,
        "bill_amount_currency"          => "RD",
        "fx_rate"                       => 43.7105,
        "bill_amount_usd"               => 17.34,
        "bill_amount_chain_currency"    => 17.34,
        "payment_transaction_fee"       => 3.0,
        "payment_total_usd"             => 20.34,
        "payment_total_chain_currency"  => 20.34,
        "chain_earned"                  => 0.0,
        "chain_paid"                    => 20.34,
        "starting_balance"              => -93.2,
        "ending_balance"                => -113.54,
        "hours_to_fulfill"              => 0,
        "discount"                      => 0.0,
        "sms_text"                      => "Tu pago de Edesur por $758.00RD se realizo con éxito! Ahora también puedes pagar tu factura de Edenorte, Viva y Claro en tu tienda Regalii.",
        "created_at"                    =>"2015-12-22T18:48:02.000Z"
      }

      assert_equal hash, response.data
    end
  end
end

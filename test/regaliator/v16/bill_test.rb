require 'test_helper'

module Regaliator
  module V16
    class BillTest < Minitest::Test
      def setup
        @config = Configuration.new.tap do |config|
          config.version    = API_VERSION
          config.api_key    = 'testing'
          config.secret_key = 'testing'
          config.host       = 'api.regalii.dev'
          config.use_ssl    = false
        end
      end

      def test_index
        VCR.use_cassette('v16/bill/index') do |cassette|
          response = Regaliator.new(@config).bill.index

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_consult
        VCR.use_cassette('v16/bill/consult') do |cassette|
          response = Regaliator.new(@config).bill.consult(
            biller_id: 14,
            account_number: '6463060086',
            user_id: 12981
          )

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_pay
        VCR.use_cassette('v16/bill/pay') do |cassette|
          response = Regaliator.new(@config).bill.pay(
            biller_id: 14,
            account_number: '6463060086',
            user_id: 12981,
            amount: 99,
            currency: 'DOP'
          )

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_check
        VCR.use_cassette('v16/bill/check') do |cassette|
          response = Regaliator.new(@config).bill.check(
            biller_id: 9,
            account_number: '6463060086',
            amount: 50
          )

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end
    end
  end
end

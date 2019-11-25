require 'test_helper'

module Regaliator
  module V16
    class TransactionTest < Minitest::Test
      def setup
        @config = Configuration.new.tap do |config|
          config.version    = API_VERSION
          config.api_key    = 'testing'
          config.secret_key = 'testing'
          config.host       = 'api.regalii.dev'
          config.use_ssl    = false
        end
      end

      def test_list
        VCR.use_cassette('v16/transaction/list') do |cassette|
          response = Regaliator.new(@config).transaction.list

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_with_search
        VCR.use_cassette('v16/transaction/search') do |cassette|
          response = Regaliator.new(@config).transaction.list('q[id_eq]' => 1)

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_pay
        VCR.use_cassette('v16/transaction/pay') do |cassette|
          response = Regaliator.new(@config).transaction.pay(id: 1)

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_reverse
        VCR.use_cassette('v16/transaction/reverse') do |cassette|
          response = Regaliator.new(@config).transaction.reverse(id: 1)

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_cancel
        VCR.use_cassette('v16/transaction/cancel') do |cassette|
          response = Regaliator.new(@config).transaction.cancel(id: 1)

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end
    end
  end
end

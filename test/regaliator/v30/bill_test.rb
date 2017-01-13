require 'test_helper'

module Regaliator
  module V30
    class BillTest < Minitest::Test
      def setup
        @config = Configuration.new.tap do |config|
          config.version    = API_VERSION
          config.api_key    = 'api-key'
          config.secret_key = 'secret-key'
          config.host       = 'api.regalii.dev'
          config.use_ssl    = false
        end
      end

      def test_create
        VCR.use_cassette('v30/bill/create') do |cassette|
          response = Regaliator.new(@config).bill.create(biller_id: 2, account_number: '8081969')

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_update
        VCR.use_cassette('v30/bill/update') do |cassette|
          response = Regaliator.new(@config).bill.update(5, name_on_account: 'Test name')

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_show
        VCR.use_cassette('v30/bill/show') do |cassette|
          response = Regaliator.new(@config).bill.show(5)

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_xdata
        VCR.use_cassette('v30/bill/xdata') do |cassette|
          response = Regaliator.new(@config).bill.xdata(674101)

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_refresh
        VCR.use_cassette('v30/bill/refresh') do |cassette|
          response = Regaliator.new(@config).bill.refresh(5)

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_pay
        VCR.use_cassette('v30/bill/pay') do |cassette|
          response = Regaliator.new(@config).bill.pay(5, amount: 758.0, currency: 'RD')

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_list
        VCR.use_cassette('v30/bill/list') do
          response = Regaliator.new(@config).bill.list

          assert response.success?
          assert_equal response.data['bills'].size, 1
        end
      end
    end
  end
end

require 'test_helper'

module Regaliator
  module V31
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

      def test_create
        VCR.use_cassette('V31/bill/create') do |cassette|
          response = Regaliator.new(@config).bill.create(biller_id: 2, account_number: '8081969')

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_update
        VCR.use_cassette('V31/bill/update') do |cassette|
          response = Regaliator.new(@config).bill.update(695109, name_on_account: 'Test name')

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_show
        VCR.use_cassette('V31/bill/show') do |cassette|
          response = Regaliator.new(@config).bill.show(695109)

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_xdata
        VCR.use_cassette('V31/bill/xdata') do |cassette|
          response = Regaliator.new(@config).bill.xdata(695109)

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_refresh
        VCR.use_cassette('V31/bill/refresh') do |cassette|
          response = Regaliator.new(@config).bill.refresh(695109)

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_pay
        VCR.use_cassette('V31/bill/pay') do |cassette|
          response = Regaliator.new(@config).bill.pay(695109,
            amount: 758.0,
            currency: 'RD',
            user_id: 12981
          )

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_list
        VCR.use_cassette('V31/bill/list') do
          response = Regaliator.new(@config).bill.list

          assert response.success?
          assert_equal 100, response.data['bills'].size
        end
      end

      def test_delete
        VCR.use_cassette('V31/bill/delete') do |cassette|
          response = Regaliator.new(@config).bill.delete(695111)

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

    end
  end
end

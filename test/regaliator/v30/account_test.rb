require 'test_helper'

module Regaliator
  module V30
    class AccountTest < Minitest::Test
      def setup
        @config = Configuration.new.tap do |config|
          config.version    = API_VERSION
          config.api_key    = 'api-key'
          config.secret_key = 'secret-key'
          config.host       = 'api.regalii.dev'
          config.use_ssl    = false
        end
      end

      def test_successful_info
        VCR.use_cassette('account/successful_info') do |cassette|
          response = Regaliator.new(@config).account.info

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_failed_info
        @config.secret_key = 'bogus'

        VCR.use_cassette('account/failed_info') do |cassette|
          response = Regaliator.new(@config).account.info

          refute response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end
    end
  end
end

require 'test_helper'

module Regaliator
  module V32
    class BillerTest < Minitest::Test
      def setup
        @config = Configuration.new.tap do |config|
          config.version    = API_VERSION
          config.api_key    = 'testing'
          config.secret_key = 'testing'
          config.host       = 'apix.regalii.dev'
          config.use_ssl    = false
        end
      end

      def test_list_credentials
        VCR.use_cassette('V32/biller/credentials') do |cassette|
          response = Regaliator.new(@config).biller.credentials

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_list_topups
        VCR.use_cassette('V32/biller/topups') do |cassette|
          response = Regaliator.new(@config).biller.topups

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_list_utilities
        VCR.use_cassette('V32/biller/utilities') do |cassette|
          response = Regaliator.new(@config).biller.utilities

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end
    end
  end
end

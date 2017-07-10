require 'test_helper'

module Regaliator
  module V32
    class RateTest < Minitest::Test
      def setup
        @config = Configuration.new.tap do |config|
          config.version    = API_VERSION
          config.api_key    = 'testing'
          config.secret_key = 'testing'
          config.host       = 'apix.regalii.dev'
          config.use_ssl    = false
        end
      end

      def test_list
        VCR.use_cassette('V32/rate/list') do |cassette|
          response = Regaliator.new(@config).rate.list

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end

      def test_history
        VCR.use_cassette('V32/rate/history') do |cassette|
          response = Regaliator.new(@config).rate.history

          assert response.success?
          assert_equal extract_hsh(cassette), response.data
        end
      end
    end
  end
end

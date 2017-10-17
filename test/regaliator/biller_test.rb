require 'test_helper'

module Regaliator
  class BillerTest < Minitest::Test
    def setup
      @config = Configuration.new.tap do |config|
        config.api_key    = 'testing'
        config.secret_key = 'testing'
        config.host       = 'api.regalii.dev'
        config.use_ssl    = false
      end
    end

    def test_list_topups
      VCR.use_cassette('biller/topups') do |cassette|
        response = Regaliator.new(@config).biller.topups

        assert response.success?
        assert_equal extract_hsh(cassette), response.data
      end
    end

    def test_list_utilities
      VCR.use_cassette('biller/utilities') do |cassette|
        response = Regaliator.new(@config).biller.utilities

        assert response.success?
        assert_equal extract_hsh(cassette), response.data
      end
    end
  end
end

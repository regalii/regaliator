require 'test_helper'

module Regaliator
  class V31Test < Minitest::Test
    def test_api_version_constant_is_defined
      assert V31.const_defined?(:API_VERSION)
      assert_match /\A\d+\.\d+\z/, V31::API_VERSION, 'format unexpected'
    end
  end
end

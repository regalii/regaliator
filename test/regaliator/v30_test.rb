require 'test_helper'

module Regaliator
  class V30Test < Minitest::Test
    def test_api_version_constant_is_defined
      assert V30.const_defined?(:API_VERSION)
      assert_match /\A\d+\.\d+\z/, V30::API_VERSION, 'format unexpected'
    end
  end
end

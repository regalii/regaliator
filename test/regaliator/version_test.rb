require 'test_helper'

module Regaliator
  class V30Test < Minitest::Test
    def test_api_version_constant_is_defined
      assert Regaliator.const_defined?(:VERSION)
      assert_match /\A\d+\.\d+.\d+(?:\.\w+)?\z/, Regaliator::VERSION, 'format unexpected'
    end
  end
end

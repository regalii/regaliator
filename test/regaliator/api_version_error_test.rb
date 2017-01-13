require 'test_helper'

module Regaliator
  class APIVersionErrorTest < Minitest::Test
    def test_class_inherits_from_standard_error
      assert_operator APIVersionError, :<, StandardError
    end

    def test_constructor_expects_a_version
      subject = APIVersionError.new('1.0')
      assert_match /1\.0/, subject.message
    end
  end
end

require 'test_helper'

class RegaliatorTest < Minitest::Test
  def test_api_versions_constant_is_defined
    assert Regaliator.const_defined?(:API_VERSIONS)
  end

  def test_api_versions_has_good_format
    Regaliator::API_VERSIONS.each do |version, client|
      assert_instance_of String, version
      assert_instance_of Module, client
    end
  end
end

require 'test_helper'

class Regaliator::RateTest < Minitest::Test
  def setup
    Regaliator.configure do |config|
      config.api_key    = 'api-key'
      config.secret_key = 'secret-key'
      config.host       = 'api.regalii.dev'
      config.use_ssl    = false
    end
  end

  def test_list
    VCR.use_cassette('rate/list') do
      response = Regaliator::Rate.list

      assert response.success?

      hash = {
        "MXN" => 16.488,
        "RD" => 43.7165
      }

      assert_equal hash, response.data
    end
  end

  def test_history
    VCR.use_cassette('rate/history') do
      response = Regaliator::Rate.history

      assert response.success?

      hash = {"2016-03-22"=>{}}

      assert_equal hash, response.data
    end
  end
end

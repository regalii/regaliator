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
        "GBP" =>  0.6479,
        "CAD" =>  1.3095,
        "MXN" =>  16.6048,
        "RD"  =>  44.365,
        "NIO" =>  26.9834,
        "GTQ" =>  7.5274,
        "HNL" =>  21.4265,
        "COP" =>  3024.4074,
        "BRL" =>  3.9135,
        "PEN" =>  3.164,
        "BOB" =>  6.7661,
        "PHP" =>  45.8195,
        "INR" =>  64.3778,
        "JMD" =>  115.885,
        "NGN" =>  195.1023
      }

      assert_equal hash, response.data
    end
  end

  def test_history
    VCR.use_cassette('rate/history') do
      response = Regaliator::Rate.history

      assert response.success?

      hash = {
        "2015-12-22"=>
          {
            "GBP" => 0.6613,
            "CAD" => 1.3654,
            "MXN" => 16.8346,
            "RD"  => 44.6211,
            "NIO" => 27.3261,
            "GTQ" => 7.4664,
            "HNL" => 21.3473,
            "COP" => 3255.7266,
            "BRL" => 3.918,
            "PEN" => 3.3183,
            "BOB" => 6.7695,
            "PHP" => 46.2856,
            "INR" => 64.9091,
            "JMD" => 117.6059,
            "NGN" => 194.7985
          },
        "2015-12-21"=>{},
        "2015-12-20"=>{}
      }

      assert_equal hash, response.data
    end
  end
end

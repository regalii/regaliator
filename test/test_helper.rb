require 'test/unit'
require 'regaliator'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/vcr_cassettes'
  c.hook_into :webmock
<<<<<<< HEAD
  c.before_record do |i|
    i.response.body.force_encoding('UTF-8')
  end
=======
>>>>>>> develop
end

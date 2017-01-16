require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require 'minitest/autorun'
require 'regaliator'
require 'vcr'
require 'json'

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.before_record do |i|
    i.response.body.force_encoding('UTF-8')
  end
end

def extract_hsh(cassette)
  response = cassette.serializable_hash['http_interactions'][0]['response']

  JSON.parse(response['body']['string']).tap do |body|
    pagination = response['headers']['X-Pagination']
    if !pagination.nil? && !pagination.empty?
      body.merge!('pagination' => JSON.parse(response['headers']['X-Pagination'][0]))
    end
  end
end

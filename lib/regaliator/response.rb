require 'json'
require 'net/http'

module Regaliator
  class Response
    PAGINATION_HEADER = 'X-Pagination'.freeze

    attr_reader :http_response

    def initialize(http_response)
      @http_response = http_response
    end

    def data
      @data ||= begin
        JSON.parse(http_response.body).tap do |hsh|
          hsh.merge!('pagination' => pagination) if paginated?
        end
      rescue
        { message: 'Server returned a non-json error' }
      end
    end

    def success?
      @success ||= http_response.is_a?(Net::HTTPSuccess)
    end

    def fail?
      !success?
    end

    def paginated?
      http_response.key?(PAGINATION_HEADER)
    end

    def pagination
      @pagination ||= JSON.parse(http_response[PAGINATION_HEADER])
    end
  end
end

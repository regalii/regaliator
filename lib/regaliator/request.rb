require 'base64'
require 'digest'
require 'net/http'
require 'openssl'
require 'uri'
require 'regaliator/response'
require 'regaliator/version'

module Regaliator
  class Request
    CONTENT_TYPE = 'application/json'.freeze

    attr_reader :config, :http, :http_request, :uri, :endpoint, :params, :timestamp

    def initialize(config, endpoint, params = {})
      @config    = config
      @timestamp = Time.now.utc.httpdate.to_s
      @endpoint  = endpoint
      @params    = params
      @uri       = build_uri
      @http      = build_http
    end

    def post
      @http_request = Net::HTTP::Post.new(uri.request_uri)
      @http_request.body = params.to_json

      send_request
    end

    def get
      uri.query = URI.encode_www_form(params) if !params.empty?
      @http_request = Net::HTTP::Get.new(uri.request_uri)

      send_request
    end

    def patch
      @http_request = Net::HTTP::Patch.new(uri.request_uri)
      @http_request.body = params.to_json
      send_request
    end

    def delete
      @http_request = Net::HTTP::Delete.new(uri.request_uri)
      @http_request.body = params.to_json

      send_request
    end

    def send_request
      apply_headers

      response = http.request(http_request)
      Regaliator::Response.new(response)
    end

    private

    def build_uri
      protocol = config.secure? ? 'https' : 'http'
      url = ["#{protocol}://#{config.host}", endpoint].join
      URI.parse(url)
    end

    def build_http
      http = Net::HTTP::Proxy(config.proxy_host,
                              config.proxy_port,
                              config.proxy_user,
                              config.proxy_pass).new(uri.host, uri.port)

      http.read_timeout = config.read_timeout
      http.open_timeout = config.open_timeout
      http.use_ssl      = config.secure?
      http.ssl_version  = :TLSv1

      http
    end

    def apply_headers
      {
        'User-Agent'    => "Regaliator gem v#{Regaliator::VERSION}",
        'Accept'        => "application/vnd.regalii.v#{config.version}+json",
        'Content-Type'  => CONTENT_TYPE,
        'Date'          => timestamp,
        'Content-MD5'   => content_md5,
        'Authorization' => authorization
      }.each { |k,v| http_request[k] = v }
    end

    def authorization
      digest = OpenSSL::Digest.new('sha1')
      auth = Base64.strict_encode64(OpenSSL::HMAC.digest(digest, config.secret_key, canonical_string))

      "APIAuth #{config.api_key}:#{auth}"
    end

    def canonical_string
      [CONTENT_TYPE, content_md5, http_request.path, timestamp].join(',')
    end

    def content_md5
      Digest::MD5.base64digest(http_request.body) if http_request.body
    end
  end
end

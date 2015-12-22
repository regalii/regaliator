module RegaliiCli
  class Request
    CONTENT_TYPE = 'application/json'

    attr_reader :config, :http, :http_request, :uri, :endpoint, :params, :timestamp

    def initialize(endpoint, params = {})
      @config         = RegaliiCli.configuration
      @timestamp      = Time.now.utc.httpdate.to_s
      @endpoint       = endpoint
      @params         = params
      @uri            = build_uri
      @http           = build_http
      @http_request   = build_request

      apply_headers
    end

    def post
      response = http.request(http_request)

      RegaliiCli::Response.new(response)
    end

    private

    def build_uri
      protocol = config.secure? ? 'https' : 'http'
      url = "#{protocol}://#{config.host}/#{endpoint}"
      uri = URI.parse(url)
      uri
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

    def build_request
      request = Net::HTTP::Post.new(uri.request_uri)
      request.body = params.to_json
      request
    end

    def apply_headers
      {
        'User-Agent'    => "RegaliiCli gem v#{RegaliiCli::VERSION}",
        'Accept'        => "application/vnd.regalii.v#{config.version}+json",
        'Content-Type'  => CONTENT_TYPE,
        'Date'          => timestamp,
        'Content-MD5'   => content_md5,
        'Authorization' => authorization
      }.each do |k,v|
        http_request[k] = v
      end
    end

    def authorization
      digest = OpenSSL::Digest.new('sha1')
      auth = Base64.strict_encode64(OpenSSL::HMAC.digest(digest, config.secret_key, canonical_string))

      "APIAuth #{config.api_key}:#{auth}"
    end

    def canonical_string
      canonical_string = [CONTENT_TYPE, content_md5, http_request.path, timestamp].join(',')
    end

    def content_md5
      Digest::MD5.base64digest(http_request.body)
    end
  end
end

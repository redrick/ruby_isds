module RubyIsds
  class Request
    def initialize(params = {})
      params.each do |k, v|
        instance_variable_set("@#{k}", v)
      end if params.any?
    end

    def self.call(params = {})
      new(params).call
    end

    # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/MethodLength
    def call
      uri = URI(full_url)

      request = Net::HTTP::Post.new(uri)
      default_headers.each { |k, v| request[k] = v }
      request.body = to_xml

      https = Net::HTTP.new(uri.hostname, uri.port)
      https.use_ssl = true
      https.ssl_version = :TLSv1_2_client
      if RubyIsds.configuration.cert_file
        https.verify_mode = OpenSSL::SSL::VERIFY_PEER
        https.cert = RubyIsds.configuration.cert_file
        https.key = RubyIsds.configuration.private_key
        https.verify_depth = 5
        request.basic_auth(RubyIsds.configuration.data_box, '')
      else
        request.basic_auth(
          RubyIsds.configuration.username,
          RubyIsds.configuration.password
        )
      end
      response = https.request(request)
      call_reponse_wrapper(response)
    end
    # rubocop:enable Metrics/MethodLength
    # rubocop:enable Metrics/AbcSize

    def call_reponse_wrapper(response)
      response_wrapper.new(response)
    end

    def default_headers
      {
        'Content-Type' =>  'text/xml;charset=UTF-8',
        'Accept-Encoding' => 'gzip,deflate'
      }
    end

    def to_xml
      Nokogiri::XML::Builder.new(encoding: 'utf-8') do |xml|
        xml[:soapenv].Envelope(envelope_namespaces) do
          xml[:soapenv].Header
          xml[:soapenv].Body do
            body(xml)
          end
        end
      end.to_xml
    end

    def envelope_namespaces
      {
        'xmlns:soapenv' => 'http://schemas.xmlsoap.org/soap/envelope/',
        'xmlns:v20' => xml_url
      }
    end

    def full_url
      "#{RubyIsds.configuration.api_domain}#{api_url}"
    end

    ##
    # each subclass needs to have availbale attrs put in constant `ATTRS`
    #
    def values(xml)
      self.class::ATTRS.each do |attribute|
        value = instance_variable_get("@#{attribute}") || ''
        xml[:v20].public_send(attribute, value)
      end
    end

    ##
    # Each subclass must implement
    #   this is whole body of message which differs and also needs to be
    #   accompanied with att_accessors
    #
    def body
      raise NotImplementedError, "#{self.class} must implement #body!"
    end

    ##
    # relative part of url because they differ...
    #   domain such as https://ws1.czebox.cz is take from config as such:
    #     `RubyIsds.configuration.api_domain`
    #   it includes `https://` so only ending is supposed to be here
    #
    def api_url
      raise NotImplementedError, "#{self.class} must implement #api_url!"
    end

    ##
    # URL will differ based on endpoint that it accesses
    #
    def xml_url
      "https://#{RubyIsds.configuration.xml_url}"
    end

    ##
    # Here you can change which response object will wrap the reponse
    #   reponse object has to inherit from `::RubyIsds::Response`
    #
    def response_wrapper
      ::RubyIsds::Response
    end
  end
end

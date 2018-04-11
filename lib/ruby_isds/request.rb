module RubyIsds
  class Request
    def initialize(params = {})
    end

    def default_headers
      {
        'Content-Type' =>  'text/xml;charset=UTF-8',
        'Authorization' => "Basic #{auth}",
        'Accept-Encoding' => 'gzip,deflate'
      }
    end

    def auth
      Base64.encode64("#{RubyIsds.configuration.username}:#{RubyIsds.configuration.password}")
    end

    def envelope
      Nokogiri::XML::Builder.new(:encoding => 'utf-8') do |xml|
        xml.send('soapenv:Envelope', 'xmlns:soapenv' => 'http://schemas.xmlsoap.org/soap/envelope/', 'xmlns:core' => 'http://gpe.cz/pay/pay-ws/core') {}
      end.to_xml
    end
  end
end

RSpec.describe RubyIsds::WebServices::DmOperations::Ping do
  it_behaves_like 'web service'

  describe '#to_xml' do
    it 'expects correctly formatted xml request' do
      web_service = RubyIsds::WebServices::DmOperations::Ping.new

      expect(web_service.to_xml)
        .to eq("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"\
               "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org"\
               "/soap/envelope/\" xmlns:v20=\"https://isds.czechpoint.cz/v20\">\n"\
               "  <soapenv:Header/>\n  <soapenv:Body>\n    <v20:DummyOperation/>\n"\
               "  </soapenv:Body>\n</soapenv:Envelope>\n")
    end
  end

  describe '#call' do
    it 'receives correct response from API' do
      web_service = RubyIsds::WebServices::DmOperations::Ping.new

      VCR.use_cassette 'web_services/dm_operations/ping' do
        result = web_service.call
        expect(result).to be_a(RubyIsds::WebServices::DmOperations::Response)
        expect(result.status).to be_a(RubyIsds::Responses::Dm::Status)
        expect(result.status.code).to eq('0000')
        expect(result.status.message).to eq('Provedeno úspěšně.')
      end
    end
  end
end

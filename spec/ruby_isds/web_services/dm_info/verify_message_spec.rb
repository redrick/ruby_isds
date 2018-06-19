RSpec.describe RubyIsds::WebServices::DmInfo::VerifyMessage do
  it_behaves_like 'web service'

  describe '#to_xml' do
    it 'expects correctly formatted xml request' do
      web_service = RubyIsds::WebServices::DmInfo::VerifyMessage.new

      expect(web_service.to_xml)
        .to eq("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<soapenv:Envelope "\
               "xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" "\
               "xmlns:v20=\"http://isds.czechpoint.cz/v20\">\n  <soapenv:Header/>\n"\
               "  <soapenv:Body>\n    <v20:VerifyMessage>\n      <v20:dmID/>\n    "\
               "</v20:VerifyMessage>\n  </soapenv:Body>\n</soapenv:Envelope>\n")
    end
  end

  describe '#call' do
    it 'receives correct response from API' do
      web_service = RubyIsds::WebServices::DmInfo::VerifyMessage.new(dmID: '6495272')

      VCR.use_cassette 'web_services/dm_info/verify_message' do
        result = web_service.call
        expect(result).to be_a(RubyIsds::WebServices::DmInfo::Response)
        expect(result.status).to be_a(RubyIsds::Responses::Dm::Status)
        expect(result.status.code).to eq('0000')
        expect(result.status.message).to eq('Provedeno úspěšně.')

        expect(result.body.dmHash).to eq("RLQOGdZ0K+GbUn9923r5vHjkWtnGhNUdM1Z5b5lAJQI=\n")
      end
    end
  end
end

RSpec.describe RubyIsds::WebServices::DmInfo::GetMessageStateChanges do
  it_behaves_like 'web service'

  describe '#to_xml' do
    it 'expects correctly formatted xml request' do
      web_service = RubyIsds::WebServices::DmInfo::GetMessageStateChanges.new

      expect(web_service.to_xml)
        .to eq("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<soapenv:Envelope "\
               "xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" "\
               "xmlns:v20=\"http://isds.czechpoint.cz/v20\">\n  <soapenv:Header/>\n"\
               "  <soapenv:Body>\n    <v20:GetMessageStateChanges>\n      "\
               "<v20:dmFromTime/>\n      <v20:dmToTime/>\n    "\
               "</v20:GetMessageStateChanges>\n  </soapenv:Body>\n</soapenv:Envelope>\n")
    end
  end

  describe '#call' do
    it 'receives correct response from API' do
      Timecop.freeze '22.5.2018'
      web_service = RubyIsds::WebServices::DmInfo::GetMessageStateChanges
        .new(dmFromTime: 2.months.ago.iso8601, dmToTime: Time.now.iso8601)

      VCR.use_cassette 'web_services/dm_info/get_message_state_changes' do
        result = web_service.call
        expect(result).to be_a(RubyIsds::WebServices::DmInfo::Response)
        expect(result.status).to be_a(RubyIsds::Responses::Dm::Status)
        expect(result.status.code).to eq('0000')
        expect(result.status.message).to eq('Provedeno úspěšně.')
      end
      Timecop.return
    end
  end
end

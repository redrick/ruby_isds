RSpec.describe RubyIsds::WebServices::DmInfo::GetListOfReceivedMessages do
  it_behaves_like 'web service'

  describe '#to_xml' do
    it 'expects correctly formatted xml request' do
      web_service = RubyIsds::WebServices::DmInfo::GetListOfReceivedMessages.new

      expect(web_service.to_xml)
        .to eq("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<soapenv:Envelope "\
               "xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" "\
               "xmlns:v20=\"http://isds.czechpoint.cz/v20\">\n  <soapenv:Header/>\n"\
               "  <soapenv:Body>\n    <v20:GetListOfReceivedMessages>\n      "\
               "<v20:dmFromTime/>\n      <v20:dmToTime/>\n      "\
               "<v20:dmRecipientOrgUnitNum/>\n      <v20:dmStatusFilter/>\n      "\
               "<v20:dmOffset/>\n      <v20:dmLimit/>\n    "\
               "</v20:GetListOfReceivedMessages>\n  "\
               "</soapenv:Body>\n</soapenv:Envelope>\n")
    end
  end

  describe '#call' do
    it 'receives correct response from API' do
      web_service = RubyIsds::WebServices::DmInfo::GetListOfReceivedMessages.new

      VCR.use_cassette 'web_services/dm_info/get_list_of_received_messages' do
        result = web_service.call
        expect(result).to be_a(RubyIsds::Responses::Messages::Collection)
        expect(result.status).to be_a(RubyIsds::Responses::Dm::Status)
        expect(result.status.code).to eq('0000')
        expect(result.status.message).to eq('Provedeno úspěšně.')

        expect(result.messages.first).to be_a(RubyIsds::DataMessage)
      end
    end
  end
end

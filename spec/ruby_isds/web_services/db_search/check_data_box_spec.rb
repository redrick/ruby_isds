RSpec.describe RubyIsds::WebServices::DbSearch::CheckDataBox do
  it_behaves_like 'web service'

  describe '#to_xml' do
    it 'expects correctly formatted xml request' do
      web_service = RubyIsds::WebServices::DbSearch::CheckDataBox.new

      expect(web_service.to_xml)
        .to eq("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<soapenv:Envelope "\
               "xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" "\
               "xmlns:v20=\"http://isds.czechpoint.cz/v20\">\n  <soapenv:Header/>\n  "\
               "<soapenv:Body>\n    <v20:CheckDataBox>\n      <v20:dbID/>\n      "\
               "<v20:dbApproved/>\n      <v20:dbExternRefNumber/>\n    "\
               "</v20:CheckDataBox>\n  </soapenv:Body>\n</soapenv:Envelope>\n")
    end
  end

  describe '#call' do
    it 'receives correct response from API' do
      web_service = RubyIsds::WebServices::DbSearch::CheckDataBox
        .new(dbID: ::RubyIsds.configuration.data_box)

      VCR.use_cassette 'web_services/db_search/check_data_box' do
        result = web_service.call
        expect(result).to be_a(RubyIsds::WebServices::DbSearch::Response)
        expect(result.status).to be_a(RubyIsds::Responses::Db::Status)
        expect(result.status.code).to eq('0000')
        expect(result.status.message).to eq('Provedeno úspěšně.')

        expect(result.body.dbState).to eq('1')
      end
    end
  end
end

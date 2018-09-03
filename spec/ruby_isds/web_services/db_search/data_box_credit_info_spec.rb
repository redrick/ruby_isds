RSpec.describe RubyIsds::WebServices::DbSearch::DataBoxCreditInfo do
  it_behaves_like 'web service'

  describe '#to_xml' do
    it 'expects correctly formatted xml request' do
      web_service = RubyIsds::WebServices::DbSearch::DataBoxCreditInfo.new

      expect(web_service.to_xml)
        .to eq("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<soapenv:Envelope "\
               "xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" "\
               "xmlns:v20=\"https://isds.czechpoint.cz/v20\">\n  <soapenv:Header/>\n"\
               "  <soapenv:Body>\n    <v20:DataBoxCreditInfo>\n      <v20:dbID/>\n"\
               "      <v20:ciFromDate/>\n      <v20:ciTodate/>\n    "\
               "</v20:DataBoxCreditInfo>\n  </soapenv:Body>\n</soapenv:Envelope>\n")
    end
  end

  describe '#call' do
    it 'receives correct response from API' do
      web_service = RubyIsds::WebServices::DbSearch::DataBoxCreditInfo
        .new(dbID: ::RubyIsds.configuration.data_box)

      VCR.use_cassette 'web_services/db_search/data_box_credit_info' do
        result = web_service.call
        expect(result).to be_a(RubyIsds::WebServices::DbSearch::Response)
        expect(result.status).to be_a(RubyIsds::Responses::Db::Status)
        expect(result.status.code).to eq('0000')
        expect(result.status.message).to eq('Provedeno úspěšně.')

        expect(result.body.ciRecords).to be_nil
        expect(result.body.currentCredit).to eq('598200')
      end
    end
  end
end

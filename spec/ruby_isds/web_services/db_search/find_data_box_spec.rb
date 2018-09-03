RSpec.describe RubyIsds::WebServices::DbSearch::FindDataBox do
  it_behaves_like 'web service'

  describe '#to_xml' do
    it 'expects correctly formatted xml request' do
      web_service = RubyIsds::WebServices::DbSearch::FindDataBox
        .new(dbType: 'FO', pnLastName: 'Antaš')

      expect(web_service.to_xml)
        .to eq("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<soapenv:Envelope "\
               "xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" "\
               "xmlns:v20=\"https://isds.czechpoint.cz/v20\">\n  <soapenv:Header/>\n  "\
               "<soapenv:Body>\n    <v20:FindDataBox>\n      <v20:dbOwnerInfo>\n"\
               "        <v20:dbID/>\n        <v20:dbType>FO</v20:dbType>\n        "\
               "<v20:ic/>\n        <v20:pnFirstName/>\n        <v20:pnMiddleName/>\n"\
               "        <v20:pnLastName>Antaš</v20:pnLastName>\n       "\
               " <v20:pnLastNameAtBirth/>\n        <v20:firmName/>\n        "\
               "<v20:biDate/>\n        <v20:biCity/>\n        <v20:biCounty/>\n"\
               "        <v20:biState/>\n        <v20:adCity/>\n        "\
               "<v20:adStreet/>\n        <v20:adNumberInStreet/>\n       "\
               " <v20:adNumberInMunicipality/>\n        <v20:adZipCode/>\n       "\
               " <v20:adState/>\n        <v20:nationality/>\n        <v20:email/>\n"\
               "        <v20:telNumber/>\n        <v20:identifier/>\n       "\
               " <v20:registryCode/>\n        <v20:dbState/>\n       "\
               " <v20:dbEffectiveOVM/>\n        <v20:dbOpenAddressing/>\n     "\
               " </v20:dbOwnerInfo>\n    </v20:FindDataBox>\n "\
               " </soapenv:Body>\n</soapenv:Envelope>\n")
    end
  end

  describe '#call' do
    it 'receives correct response from API (found result)' do
      web_service = RubyIsds::WebServices::DbSearch::FindDataBox
        .new(dbType: 'FO', pnLastName: 'Antaš')

      VCR.use_cassette 'web_services/db_search/find_data_box_one' do
        result = web_service.call
        expect(result).to be_a(RubyIsds::WebServices::DbSearch::Response)
        expect(result.status).to be_a(RubyIsds::Responses::Db::Status)
        expect(result.status.code).to eq('0000')
        expect(result.status.message).to eq('Provedeno úspěšně.')
      end
    end

    it 'receives correct response from API (nothing found)' do
      web_service = RubyIsds::WebServices::DbSearch::FindDataBox
        .new(dbType: 'FO', pnLastName: 'Antas')

      VCR.use_cassette 'web_services/db_search/find_data_box_none' do
        result = web_service.call
        expect(result).to be_a(RubyIsds::WebServices::DbSearch::Response)
        expect(result.status).to be_a(RubyIsds::Responses::Db::Status)
        expect(result.status.code).to eq('0002')
        expect(result.status.message)
          .to eq('Podmínkám neodpovídá žádná datová schránka.')
      end
    end

    xit 'receives correct response from API (getting result and parsing OwnerInfo)' do
    end
  end
end

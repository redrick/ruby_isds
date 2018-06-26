RSpec.describe RubyIsds::Responses::Db::Status do
  describe '.new' do
    it 'leaves out elements that are not relevant' do
      hash = {
        "xmlns:p" => "http://isds.czechpoint.cz/v20",
        "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance",
        "dbStatus" => {
          "dbStatusCode" => "0000",
          "dbStatusMessage" => "Provedeno úspěšně."
        }
      }

      result = RubyIsds::Responses::Db::Status.new(hash)

      expect(result).to be_a(RubyIsds::Responses::Db::Status)
      expect(result.code).to eq('0000')
      expect(result.message).to eq('Provedeno úspěšně.')
    end
  end
end

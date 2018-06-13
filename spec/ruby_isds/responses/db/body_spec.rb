RSpec.describe RubyIsds::Responses::Db::Body do
  describe '.new' do
    it 'leaves out elements that are not relevant' do
      hash = {
        "xmlns:p" => "http://isds.czechpoint.cz/v20",
        "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance",
        "dbState" => "1",
        "dbStatus" => {
          "dbStatusCode" => "0000",
          "dbStatusMessage" => "Provedeno úspěšně."
        }
      }

      result = RubyIsds::Responses::Db::Body.new(hash)

      expect(result).to be_a(RubyIsds::Responses::Db::Body)
      expect(result.dbState).to eq('1')
      expect(result).not_to respond_to('xmlns:q')
      expect(result).not_to respond_to('xmlns:xsi')
    end
  end
end

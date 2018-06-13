RSpec.describe RubyIsds::Responses::Dm::Body do
  describe '.new' do
    it 'leaves out elements that are not relevant' do
      hash = {
        "xmlns:q"=>"http://isds.czechpoint.cz/v20",
        "xmlns:xsi"=>"http://www.w3.org/2001/XMLSchema-instance",
        "dmStatus"=> {
          "dmStatusCode"=>"1211",
          "dmStatusMessage"=>"Nemáte právo na přístup k zásilkám v cizí schránce."
        }
      }

      result = RubyIsds::Responses::Dm::Body.new(hash)

      expect(result).to be_a(RubyIsds::Responses::Dm::Body)
      expect(result).not_to respond_to('xmlns:q')
      expect(result).not_to respond_to('xmlns:xsi')
    end
  end
end

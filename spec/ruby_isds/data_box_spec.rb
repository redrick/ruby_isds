RSpec.describe RubyIsds::DataBox do
  describe '.check' do
    it 'correctly call underlying web service' do
      expect(::RubyIsds::WebServices::DbSearch::CheckDataBox)
        .to receive(:call).with(dbID: ::RubyIsds.configuration.data_box)

      RubyIsds::DataBox.check
    end
  end

  describe '.credit_info' do
    it 'correctly call underlying web service' do
      expect(::RubyIsds::WebServices::DbSearch::DataBoxCreditInfo)
        .to receive(:call).with(dbID: ::RubyIsds.configuration.data_box)

      RubyIsds::DataBox.credit_info
    end
  end
end

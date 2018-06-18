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

  describe '.find_by' do
    it 'correctly call underlying web service' do
      expect(::RubyIsds::WebServices::DbSearch::FindDataBox)
        .to receive(:call).with(dbType: 'FO', pnLastName: 'Antaš')

      RubyIsds::DataBox.find_by(dbType: 'FO', pnLastName: 'Antaš')
    end
  end

  describe '.received' do
    it 'correctly call underlying web service' do
      expect(::RubyIsds::WebServices::DmInfo::GetListOfReceivedMessages)
        .to receive(:call)

      RubyIsds::DataBox.received
    end
  end

  describe '.sent' do
    it 'correctly call underlying web service' do
      expect(::RubyIsds::WebServices::DmInfo::GetListOfSentMessages)
        .to receive(:call)

      RubyIsds::DataBox.sent
    end
  end
end

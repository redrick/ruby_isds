module RubyIsds
  class DataBox
    def self.check
      ::RubyIsds::WebServices::DbSearch::CheckDataBox
        .new(dbID: ::RubyIsds.configuration.data_box)
        .call
    end

    def self.received(options = {})
      RubyIsds::WebServices::DmInfo::GetListOfReceivedMessages
        .new(options.merge(dbID: 'mxbf8u6'))
        .call
    end

    def self.sent(options = {})
      RubyIsds::WebServices::DmInfo::GetListOfSentMessages
        .new(options.merge(dbID: 'mxbf8u6'))
        .call
    end
  end
end

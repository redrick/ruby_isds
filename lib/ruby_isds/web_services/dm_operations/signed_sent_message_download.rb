module RubyIsds
  module WebServices
    module DmOperations
      class SignedSentMessageDownload < ::RubyIsds::WebServices::DmOperations::Request
        ATTRS = [:dmID]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].SignedSentMessageDownload {
            values(xml)
          }
        end
      end
    end
  end
end

module RubyIsds
  module WebServices
    module DmOperations
      class SignedMessageDownload < ::RubyIsds::WebServices::DmOperations::Request
        ATTRS = [:dmID]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].SignedMessageDownload {
            values(xml)
          }
        end
      end
    end
  end
end

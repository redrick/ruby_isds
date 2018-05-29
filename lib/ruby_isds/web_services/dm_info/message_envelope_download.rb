module RubyIsds
  module WebServices
    module DmInfo
      class MessageEnvelopeDownload < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = [:dmID]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].MessageEnvelopeDownload {
            values(xml)
          }
        end
      end
    end
  end
end

module RubyIsds
  module WebServices
    module DmInfo
      class EraseMessage < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = [:dmID, :dmIncoming]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].EraseMessage {
            values(xml)
          }
        end
      end
    end
  end
end

module RubyIsds
  module WebServices
    module DmInfo
      class VerifyMessage < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = [:dmID]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].VerifyMessage {
            values(xml)
          }
        end
      end
    end
  end
end

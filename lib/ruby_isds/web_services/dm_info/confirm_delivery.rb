module RubyIsds
  module WebServices
    module DmInfo
      class ConfirmDelivery < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = [:dmID]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].ConfirmDelivery {
            values(xml)
          }
        end
      end
    end
  end
end

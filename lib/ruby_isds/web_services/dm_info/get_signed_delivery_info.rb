module RubyIsds
  module WebServices
    module DmInfo
      class GetSignedDeliveryInfo < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = [:dmID]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].GetSignedDeliveryInfo {
            values(xml)
          }
        end
      end
    end
  end
end

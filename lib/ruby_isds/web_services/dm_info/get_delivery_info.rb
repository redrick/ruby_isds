module RubyIsds
  module WebServices
    module DmInfo
      class GetDeliveryInfo < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = [:dmID]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].GetDeliveryInfo {
            values(xml)
          }
        end
      end
    end
  end
end

module RubyIsds
  module WebServices
    module DmInfo
      class GetSignedDeliveryInfo < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = [:dmID].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].GetSignedDeliveryInfo do
            values(xml)
          end
        end
      end
    end
  end
end

module RubyIsds
  module WebServices
    module DmInfo
      class ConfirmDelivery < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = [:dmID].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].ConfirmDelivery do
            values(xml)
          end
        end
      end
    end
  end
end

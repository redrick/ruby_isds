module RubyIsds
  module WebServices
    module DmInfo
      class GetListOfReceivedMessages < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = [:dmFromTime, :dmToTime, :dmRecipientOrgUnitNum,
                 :dmStatusFilter, :dmOffset, :dmLimit]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].GetListOfReceivedMessages {
            values(xml)
          }
        end
      end
    end
  end
end

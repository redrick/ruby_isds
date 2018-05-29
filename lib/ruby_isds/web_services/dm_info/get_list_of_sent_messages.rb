module RubyIsds
  module WebServices
    module DmInfo
      class GetListOfSentMessages < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = [:dmFromTime, :dmToTime, :dmSenderOrgUnitNum,
                 :dmStatusFilter, :dmOffset, :dmLimit]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].GetListOfSentMessages {
            values(xml)
          }
        end
      end
    end
  end
end

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

        def api_url
          '/DS/dx'
        end

        def xml_url
          "http://isds.#{RubyIsds.configuration.xml_url}/v20"
        end
      end
    end
  end
end

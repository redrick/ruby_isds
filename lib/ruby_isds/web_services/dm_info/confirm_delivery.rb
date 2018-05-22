module RubyIsds
  module WebServices
    module DmInfo
      class ConfirmDelivery < ::RubyIsds::Request
        ATTRS = [:dmID]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].ConfirmDelivery {
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

module RubyIsds
  module WebServices
    module DmOperations
      class MessageDownload < ::RubyIsds::Request
        ATTRS = [:dmID]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].MessageDownload {
            values(xml)
          }
        end

        def api_url
          '/DS/dz'
        end

        def xml_url
          "http://isds.#{RubyIsds.configuration.xml_url}/v20"
        end
      end
    end
  end
end

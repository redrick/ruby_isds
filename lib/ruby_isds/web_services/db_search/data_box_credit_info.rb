module RubyIsds
  module WebServices
    module DbSearch
      class DataBoxCreditInfo < ::RubyIsds::Request
        ATTRS = [:dbID, :ciFromDate, :ciTodate]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].DataBoxCreditInfo {
            values(xml)
          }
        end

        def api_url
          '/DS/df'
        end

        def xml_url
          "http://isds.#{RubyIsds.configuration.xml_url}/v20"
        end
      end
    end
  end
end

module RubyIsds
  module WebServices
    module DbSearch
      class DTInfo < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = [:dbId]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].DTInfo {
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

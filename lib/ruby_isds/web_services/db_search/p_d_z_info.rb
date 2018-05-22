module RubyIsds
  module WebServices
    module DbSearch
      class PDZInfo < ::RubyIsds::Request
        ATTRS = [:PDZSender]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].PDZInfo {
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

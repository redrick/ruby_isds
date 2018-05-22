##
# I don't think this is ever going to work... that is what they provide thou...
#
module RubyIsds
  module WebServices
    module DbSearch
      class GetDataBoxList < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = [:dblType]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].GetDataBoxList {
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

module RubyIsds
  module WebServices
    class GetDataBoxActivityStatus < ::RubyIsds::Request
      ATTRS = [:dbID, :baFrom, :baTo]

      attr_accessor *ATTRS

      def body(xml)
        xml[:v20].GetDataBoxActivityStatus {
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

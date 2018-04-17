module RubyIsds
  module WebServices
    class CheckDataBox < ::RubyIsds::Request
      ATTRS = [:dbID, :dbApproved, :dbExternRefNumber]

      attr_accessor *ATTRS

      def body(xml)
        xml[:v20].CheckDataBox {
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

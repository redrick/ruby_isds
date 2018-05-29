module RubyIsds
  module WebServices
    module DmOperations
      class Request < ::RubyIsds::Request
        def response_wrapper
          ::RubyIsds::WebServices::DmOperations::Response
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

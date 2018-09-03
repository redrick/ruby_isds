module RubyIsds
  module WebServices
    module DmInfo
      class Request < ::RubyIsds::Request
        def response_wrapper
          ::RubyIsds::WebServices::DmInfo::Response
        end

        def api_url
          '/DS/dx'
        end

        def xml_url
          "https://isds.#{RubyIsds.configuration.xml_url}/v20"
        end
      end
    end
  end
end

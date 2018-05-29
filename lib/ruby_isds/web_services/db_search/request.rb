module RubyIsds
  module WebServices
    module DbSearch
      class Request < ::RubyIsds::Request
        def response_wrapper
          ::RubyIsds::WebServices::DbSearch::Response
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

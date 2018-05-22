module RubyIsds
  module WebServices
    module DbSearch
      class Request < ::RubyIsds::Request
        def response_wrapper
          ::RubyIsds::WebServices::DbSearch::Response
        end
      end
    end
  end
end

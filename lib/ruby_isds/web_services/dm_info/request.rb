module RubyIsds
  module WebServices
    module DmInfo
      class Request < ::RubyIsds::Request
        def response_wrapper
          ::RubyIsds::WebServices::DmInfo::Response
        end
      end
    end
  end
end

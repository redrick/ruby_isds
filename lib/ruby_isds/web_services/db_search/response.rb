module RubyIsds
  module WebServices
    module DbSearch
      class Response < ::RubyIsds::Response
        def initialize(response)
          super
          @status = ::RubyIsds::Responses::Db::Status.new(parsed_body)
          @body = ::RubyIsds::Responses::Db::Body.new(parsed_body)
        end
      end
    end
  end
end

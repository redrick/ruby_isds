module RubyIsds
  module WebServices
    module DmOperations
      class Response < ::RubyIsds::Response
        def initialize(response)
          super
          @status = ::RubyIsds::Responses::Dm::Status.new(parsed_body)
          @body = ::RubyIsds::Responses::Dm::Body.new(parsed_body)
        end
      end
    end
  end
end

module RubyIsds
  module Responses
    module Messages
      class Collection < ::RubyIsds::Response
        def initialize(response)
          super
        end

        def messages
          results.map do |result|
            ::RubyIsds::DataMessage.new(result)
          end
        end

        private

        def results
          parsed_body['dmRecords']['dmRecord']
        end
      end
    end
  end
end

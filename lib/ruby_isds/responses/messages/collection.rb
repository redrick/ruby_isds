module RubyIsds
  module Responses
    module Messages
      class Collection < ::RubyIsds::Response
        def initialize(response)
          super
          # results.map do |result|
          #   ::RubyIsds::Responses::Message.new(result)
          # end
        end

        private

        def results
          parsed_body['dmRecords']['dmRecord']
        end
      end
    end
  end
end

module RubyIsds
  module Responses
    module Messages
      class Collection < ::RubyIsds::Response
        attr_accessor :messages

        def initialize(response)
          super
          @messages = load_messages
          @status = ::RubyIsds::Responses::Dm::Status.new(parsed_body)
        end

        def load_messages
          return [] if results.blank?
          return [::RubyIsds::DataMessage.new(results)] if results.is_a?(Hash)
          results.map do |result|
            ::RubyIsds::DataMessage.new(result)
          end
        end

        private

        def results
          parsed_body['dmRecords'].try(:[], 'dmRecord')
        end
      end
    end
  end
end

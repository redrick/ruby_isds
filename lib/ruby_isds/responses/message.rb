module RubyIsds
  module Responses
    class Message < ::RubyIsds::Response
      def initialize(response)
        super
      end

      def message
        ::RubyIsds::DataMessage.new(message_hash)
      end

      private

      def message_hash
        type = parsed_body['dmReturnedMessage'].first
        hash = parsed_body['dmReturnedMessage']['dmDm']
        hash.delete('xmlns:p')
        hash = type.first == 'dmType' ? hash.merge(type.first => type.last) : hash
      end
    end
  end
end

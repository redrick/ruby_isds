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
        hash = parsed_body['dmReturnedMessage']
        hash['dmDm'].delete('xmlns:p')
        hash
      end
    end
  end
end

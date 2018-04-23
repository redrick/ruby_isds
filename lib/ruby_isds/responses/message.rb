module RubyIsds
  module Responses
    class Message < ::RubyIsds::Response
      attr_accessor :attachments

      def initialize(response)
        super
        load_attachments
      end

      def load_attachments
        @attachments = if attachments_xml_part.is_a?(Array)
          attachments_xml_part.map do |attachment|
            ::RubyIsds::Responses::Messages::Attachment.new(attachment)
          end
        else
          ::RubyIsds::Responses::Messages::Attachment.new(attachments_xml_part)
        end
      end

      def attachments_xml_part
        body[result_key]['dmReturnedMessage']['dmDm']['dmFiles']['dmFile']
      end
    end
  end
end

module RubyIsds
  module Responses
    module Messages
      class DeliveryInfo < ::RubyIsds::Response
        def initialize(response)
          super
        end

        def message
          ::RubyIsds::DataMessage.new(message_hash)
        end

        private

        def message_hash
          hash = parsed_body['dmDelivery']
          hash['dmDm'].delete('xmlns:p')
          hash
        end
      end
    end
  end
end

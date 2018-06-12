module RubyIsds
  module WebServices
    module DmInfo
      class GetDeliveryInfo < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = [:dmID].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].GetDeliveryInfo do
            values(xml)
          end
        end

        def response_wrapper
          ::RubyIsds::Responses::Messages::DeliveryInfo
        end

        def call_reponse_wrapper(response)
          response_wrapper.new(response).message
        end
      end
    end
  end
end

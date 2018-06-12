module RubyIsds
  module WebServices
    module DmInfo
      class GetDeliveryInfo < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = [:dmID]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].GetDeliveryInfo {
            values(xml)
          }
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

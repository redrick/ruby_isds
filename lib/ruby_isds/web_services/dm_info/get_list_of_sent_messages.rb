module RubyIsds
  module WebServices
    module DmInfo
      class GetListOfSentMessages < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = [:dmFromTime, :dmToTime, :dmSenderOrgUnitNum,
                 :dmStatusFilter, :dmOffset, :dmLimit]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].GetListOfSentMessages {
            values(xml)
          }
        end

        def response_wrapper
          ::RubyIsds::Responses::Messages::Collection
        end

        def call_reponse_wrapper(response)
          response_wrapper.new(response).messages
        end

        def response_wrapper
          ::RubyIsds::Responses::Messages::Collection
        end

        def call_reponse_wrapper(response)
          response_wrapper.new(response).messages
        end
      end
    end
  end
end

module RubyIsds
  module WebServices
    module DmInfo
      class GetListOfSentMessages < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = %i[dmFromTime dmToTime dmSenderOrgUnitNum
                   dmStatusFilter dmOffset dmLimit].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].GetListOfSentMessages do
            values(xml)
          end
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

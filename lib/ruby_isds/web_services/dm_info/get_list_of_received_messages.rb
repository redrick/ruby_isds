module RubyIsds
  module WebServices
    module DmInfo
      class GetListOfReceivedMessages < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = %i[dmFromTime dmToTime dmRecipientOrgUnitNum
                   dmStatusFilter dmOffset dmLimit].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].GetListOfReceivedMessages do
            values(xml)
          end
        end

        def response_wrapper
          ::RubyIsds::Responses::Messages::Collection
        end

        def call_reponse_wrapper(response)
          response_wrapper.new(response)
        end
      end
    end
  end
end

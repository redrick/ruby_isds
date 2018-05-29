module RubyIsds
  module WebServices
    module DmOperations
      class MessageDownload < ::RubyIsds::WebServices::DmOperations::Request
        ATTRS = [:dmID]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].MessageDownload {
            values(xml)
          }
        end

        def response_wrapper
          ::RubyIsds::Responses::Message
        end
      end
    end
  end
end

module RubyIsds
  module WebServices
    module DmOperations
      class AuthenticateMessage < ::RubyIsds::WebServices::DmOperations::Request
        ATTRS = [:dmID]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].AuthenticateMessage {
            values(xml)
          }
        end
      end
    end
  end
end

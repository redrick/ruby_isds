module RubyIsds
  module WebServices
    module DmOperations
      class AuthenticateMessage < ::RubyIsds::WebServices::DmOperations::Request
        ATTRS = [:dmMessage].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].AuthenticateMessage do
            values(xml)
          end
        end
      end
    end
  end
end

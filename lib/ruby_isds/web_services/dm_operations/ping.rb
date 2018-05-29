module RubyIsds
  module WebServices
    module DmOperations
      class Ping < ::RubyIsds::WebServices::DmOperations::Request
        ATTRS = []

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].DummyOperation {}
        end
      end
    end
  end
end

module RubyIsds
  module WebServices
    module DmOperations
      class ResignIsdsDocument < ::RubyIsds::WebServices::DmOperations::Request
        ATTRS = [:dmDoc]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].Re-signISDSDocument {
            values(xml)
          }
        end
      end
    end
  end
end

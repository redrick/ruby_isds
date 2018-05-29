module RubyIsds
  module WebServices
    module DbSearch
      class CheckDataBox < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = [:dbID, :dbApproved, :dbExternRefNumber]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].CheckDataBox {
            values(xml)
          }
        end
      end
    end
  end
end

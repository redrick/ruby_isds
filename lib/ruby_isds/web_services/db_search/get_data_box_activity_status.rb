module RubyIsds
  module WebServices
    module DbSearch
      class GetDataBoxActivityStatus < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = [:dbID, :baFrom, :baTo]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].GetDataBoxActivityStatus {
            values(xml)
          }
        end
      end
    end
  end
end

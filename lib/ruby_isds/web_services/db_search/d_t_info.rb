module RubyIsds
  module WebServices
    module DbSearch
      class DTInfo < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = [:dbId]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].DTInfo {
            values(xml)
          }
        end
      end
    end
  end
end

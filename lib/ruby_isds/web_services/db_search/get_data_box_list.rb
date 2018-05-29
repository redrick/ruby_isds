##
# I don't think this is ever going to work... that is what they provide thou...
#
module RubyIsds
  module WebServices
    module DbSearch
      class GetDataBoxList < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = [:dblType]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].GetDataBoxList {
            values(xml)
          }
        end
      end
    end
  end
end

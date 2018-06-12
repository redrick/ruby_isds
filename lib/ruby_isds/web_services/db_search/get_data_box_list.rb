##
# I don't think this is ever going to work... that is what they provide thou...
#
module RubyIsds
  module WebServices
    module DbSearch
      class GetDataBoxList < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = [:dblType].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].GetDataBoxList do
            values(xml)
          end
        end
      end
    end
  end
end

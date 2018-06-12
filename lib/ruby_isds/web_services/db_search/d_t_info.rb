module RubyIsds
  module WebServices
    module DbSearch
      class DTInfo < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = [:dbId].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].DTInfo do
            values(xml)
          end
        end
      end
    end
  end
end

module RubyIsds
  module WebServices
    module DbSearch
      class GetDataBoxActivityStatus < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = %i[dbID baFrom baTo].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].GetDataBoxActivityStatus do
            values(xml)
          end
        end
      end
    end
  end
end

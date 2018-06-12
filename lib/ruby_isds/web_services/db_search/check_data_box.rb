module RubyIsds
  module WebServices
    module DbSearch
      class CheckDataBox < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = %i[dbID dbApproved dbExternRefNumber].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].CheckDataBox do
            values(xml)
          end
        end
      end
    end
  end
end

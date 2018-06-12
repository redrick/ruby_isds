module RubyIsds
  module WebServices
    module DbSearch
      class IsdsSearch2 < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = %i[searchText searchType searchScope page pageSize
                   highlighting].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].ISDSSearch2 do
            values(xml)
          end
        end
      end
    end
  end
end

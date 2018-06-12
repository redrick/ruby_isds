module RubyIsds
  module WebServices
    module DbSearch
      class DataBoxCreditInfo < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = %i[dbID ciFromDate ciTodate].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].DataBoxCreditInfo do
            values(xml)
          end
        end
      end
    end
  end
end

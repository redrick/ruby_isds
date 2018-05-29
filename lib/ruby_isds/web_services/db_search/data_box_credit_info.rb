module RubyIsds
  module WebServices
    module DbSearch
      class DataBoxCreditInfo < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = [:dbID, :ciFromDate, :ciTodate]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].DataBoxCreditInfo {
            values(xml)
          }
        end
      end
    end
  end
end

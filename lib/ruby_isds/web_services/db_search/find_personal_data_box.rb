module RubyIsds
  module WebServices
    module DbSearch
      class FindPersonalDataBox < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = [:dbID, :aifoIsds, :pnFirstName, :pnMiddleName, :pnLastName,
          :biDate, :biCity, :biCounty, :biState, :adCode, :adCity, :adDistrict,
          :adStreet, :adNumberInStreet, :adNumberInMunicipality,
          :adNumberInMunicipality, :adZipCode, :adState, :nationality]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].FindPersonalDataBox {
            xml[:v20].dbOwnerInfo {
              values(xml)
            }
          }
        end
      end
    end
  end
end

module RubyIsds
  module WebServices
    module DbSearch
      class FindDataBox < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = [:dbOwnerInfo, :dbID, :dbType, :ic, :pnFirstName, :pnMiddleName,
          :pnLastName, :pnLastNameAtBirth, :firmName, :biDate, :biCity, :biCounty,
          :biState, :adCity, :adStreet, :adNumberInStreet, :adNumberInMunicipality,
          :adZipCode, :adState, :nationality, :email, :telNumber, :identifier,
          :registryCode, :dbState, :dbEffectiveOVM, :dbOpenAddressing]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].FindDataBox {
            xml[:v20].dbOwnerInfo {
              values(xml)
            }
          }
        end
      end
    end
  end
end

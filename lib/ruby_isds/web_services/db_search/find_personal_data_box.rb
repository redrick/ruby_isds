module RubyIsds
  module WebServices
    module DbSearch
      class FindPersonalDataBox < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = %i[dbID aifoIsds pnFirstName pnMiddleName pnLastName
                   biDate biCity biCounty biState adCode adCity adDistrict
                   adStreet adNumberInStreet adNumberInMunicipality
                   adNumberInMunicipality adZipCode adState nationality].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].FindPersonalDataBox do
            xml[:v20].dbOwnerInfo do
              values(xml)
            end
          end
        end
      end
    end
  end
end

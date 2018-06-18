##
# FIXME: Owner info not parsed correctly, just Hash of stuff
module RubyIsds
  module WebServices
    module DbSearch
      class FindDataBox < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = %i[dbID dbType ic pnFirstName pnMiddleName
                   pnLastName pnLastNameAtBirth firmName biDate biCity biCounty
                   biState adCity adStreet adNumberInStreet adNumberInMunicipality
                   adZipCode adState nationality email telNumber identifier
                   registryCode dbState dbEffectiveOVM dbOpenAddressing].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].FindDataBox do
            xml[:v20].dbOwnerInfo do
              values(xml)
            end
          end
        end
      end
    end
  end
end

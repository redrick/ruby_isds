module RubyIsds
  module WebServices
    module DbSearch
      class IsdsSearch2 < ::RubyIsds::Request
        ATTRS = [:searchText, :searchType, :searchScope, :page, :pageSize,
                 :highlighting]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].ISDSSearch2 {
            values(xml)
          }
        end

        def api_url
          '/DS/df'
        end

        def xml_url
          "http://isds.#{RubyIsds.configuration.xml_url}/v20"
        end
      end
    end
  end
end

# Response
# {"Envelope"=>
#     {"xmlns:SOAP_ENV"=>"http://schemas.xmlsoap.org/soap/envelope/",
#      "xmlns:xsd"=>"http://www.w3.org/2001/XMLSchema",
#      "Body"=>
#       {"ISDSSearch2Response"=>
#         {"xmlns:p"=>"http://isds.czechpoint.cz/v20",
#          "xmlns:xsi"=>"http://www.w3.org/2001/XMLSchema-instance",
#          "totalCount"=>"1",
#          "currentCount"=>"1",
#          "position"=>"0",
#          "lastPage"=>"1",
#          "dbResults"=>{"dbResult"=>{"dbID"=>"mxbf8u6", "dbType"=>"FO", "dbName"=>"Andrej Antaš", "dbAddress"=>"Pekařská 695/10a, 15500 Praha 5, CZ", "dbBiDate"=>{"xsi:nil"=>"true"}, "dbICO"=>{"xsi:nil"=>"true"}, "dbEffectiveOVM"=>"0", "dbSendOptions"=>"PDZ"}},
#          "dbStatus"=>{"dbStatusCode"=>"0000", "dbStatusMessage"=>"Provedeno úspěšně."}}}}}

module RubyIsds
  module Responses
    class DataBox < Body
      REMOVED_KEYS = %w[xmlns:p xmlns:xsi dbStatus].freeze

      # FIXME: please parse:
      # {"Envelope"=>
      # {"xmlns:SOAP_ENV"=>"http://schemas.xmlsoap.org/soap/envelope/",
      #  "xmlns:xsd"=>"http://www.w3.org/2001/XMLSchema",
      #  "Body"=>
      #   {"FindDataBoxResponse"=>
      #     {"xmlns:p"=>"http://isds.czechpoint.cz/v20",
      #      "xmlns:xsi"=>"http://www.w3.org/2001/XMLSchema-instance",
      #      "dbResults"=>
      #       {"dbOwnerInfo"=>
      #         {"dbID"=>"mxbf8u6",
      #          "dbType"=>"FO",
      #          "ic"=>{"xsi:nil"=>"true"},
      #          "pnFirstName"=>"Andrej",
      #          "pnMiddleName"=>{"xsi:nil"=>"true"},
      #          "pnLastName"=>"Antaš",
      #          "pnLastNameAtBirth"=>{"xsi:nil"=>"true"},
      #          "firmName"=>{"xsi:nil"=>"true"},
      #          "biDate"=>"1990-01-16",
      #          "biCity"=>"*",
      #          "biCounty"=>"*",
      #          "biState"=>"*",
      #          "adCity"=>"Praha 5",
      #          "adStreet"=>"Pekařská",
      #          "adNumberInStreet"=>"10a",
      #          "adNumberInMunicipality"=>"695",
      #          "adZipCode"=>"15500",
      #          "adState"=>"CZ",
      #          "nationality"=>"*",
      #          "identifier"=>{"xsi:nil"=>"true"},
      #          "registryCode"=>{"xsi:nil"=>"true"},
      #          "dbState"=>"1",
      #          "dbEffectiveOVM"=>"false",
      #          "dbOpenAddressing"=>"true"}},
      #      "dbStatus"=>{"dbStatusCode"=>"0000", "dbStatusMessage"=>"Provedeno úspěšně."}}}}}
      def initialize(response)
        (response.keys - REMOVED_KEYS).each do |key|
          self.class.send(:attr_accessor, key.to_sym)
          instance_variable_set("@#{key}", response[key])
        end
      end
    end
  end
end

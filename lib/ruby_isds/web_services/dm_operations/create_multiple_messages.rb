##
#
# TODO: parsing those files and so...
module RubyIsds
  module WebServices
    module DmOperations
      class CreateMultipleMessages < ::RubyIsds::WebServices::DmOperations::Request
        ATTRS = [:dmSenderOrgUnit, :dmSenderOrgUnitNum, :dbIDRecipient,
                 :dmRecipientOrgUnit, :dmRecipientOrgUnitNum, :dmToHands,
                 :dmAnnotation, :dmRecipientRefNumber, :dmSenderRefNumber,
                 :dmRecipientIdent, :dmSenderIdent, :dmLegalTitleLaw,
                 :dmLegalTitleYear, :dmLegalTitleSect, :dmLegalTitlePar,
                 :dmLegalTitlePoint, :dmPersonalDelivery, :dmAllowSubstDelivery,
                 :dmOVM, :dmPublishOwnID]
        # + files:
        #   dmFiles: { dmFile: { dmEncodedContent: '', dmXMLContent: '' } }

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].CreateMultipleMessage {
            xml[:v20].dmEnvelope(dmType: 'WTF') {
              values(xml)
            }
          }
        end
      end
    end
  end
end

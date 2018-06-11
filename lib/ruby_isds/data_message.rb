module RubyIsds
  class DataMessage
    ATTRIBUTES = %w[dmType dmOrdinal dmID dbIDSender dmSender
      dmSenderAddress dmSenderType dmRecipient dmRecipientAddress
      dmSenderOrgUnit dmSenderOrgUnitNum dbIDRecipient dmRecipientOrgUnit
      dmRecipientOrgUnitNum dmToHands dmAnnotation dmRecipientRefNumber
      dmSenderRefNumber dmRecipientIdent dmSenderIdent dmLegalTitleLaw
      dmLegalTitleYear dmLegalTitleSect dmLegalTitlePar dmLegalTitlePoint
      dmPersonalDelivery dmAllowSubstDelivery dmMessageStatus
      dmAttachmentSize dmDeliveryTime dmAcceptanceTime dmHash
      dmQTimestamp dmAttachments dmAmbiguousRecipient]

    attr_accessor *ATTRIBUTES

    def self.find(dmID)
      RubyIsds::WebServices::DmOperations::MessageDownload
        .new(dmID: dmID)
        .call
    end

    def download(destination = '/tmp')
      File.open("#{destination}/#{dmID}.zfo", 'wb') do |f|
        f.write(Base64.decode64(signed.body.dmSignature))
      end
    end

    def initialize(params = {})
      @params = params
      @dmAttachments = load_attachments
      @params.each do |key, value|
        unless ATTRIBUTES.include?(key)
          raise "Not valid attribute of DataMessage #{key}"
        end
        instance_variable_set("@#{key}", parsed_value(value))
      end
    end

    def verify
      RubyIsds::WebServices::DmInfo::VerifyMessage
        .new(dmID: dmID)
        .call
    end

    def authenticate
      RubyIsds::WebServices::DmOperations::AuthenticateMessage
        .new(dmMessage: signed.body.dmSignature)
        .call
    end

    def signed
      RubyIsds::WebServices::DmOperations::SignedMessageDownload
        .new(dmID: dmID)
        .call
    end

    def author
      RubyIsds::WebServices::DmInfo::GetMessageAuthor
        .new(dmID: dmID)
        .call
    end

    ##
    # FIXME: needs to parse the response.... is gibberish now...
    def delivery_info
      RubyIsds::WebServices::DmInfo::GetDeliveryInfo
        .new(dmID: dmID)
        .call
    end

    def state_changes(options = {})
      RubyIsds::WebServices::DmInfo::GetMessageStateChanges
        .new(options)
        .call
    end

    ##
    # FIXME: seems like whole message, needs that parsing also....
    def envelope
      RubyIsds::WebServices::DmInfo::MessageEnvelopeDownload
        .new(dmID: dmID)
        .call
    end

    def confirm_delivery
      RubyIsds::WebServices::DmInfo::ConfirmDelivery
        .new(dmID: dmID)
        .call
    end

    def mark_as_downloaded
      RubyIsds::WebServices::DmInfo::MarkMessageAsDownloaded
        .new(dmID: dmID)
        .call
    end

    def sent?
      dbIDSender == ::RubyIsds.configuration.data_box
    end

    def received?
      dbIDSender != ::RubyIsds.configuration.data_box
    end

    private

    def load_attachments
      return {} if @params['dmFiles'].blank?
      attachments_hash = @params.delete('dmFiles')['dmFile']
      @attachments = if attachments_hash.is_a?(Array)
        attachments_hash.map do |attachment|
          ::RubyIsds::Responses::Messages::Attachment.new(attachment)
        end
      else
        ::RubyIsds::Responses::Messages::Attachment.new(attachments_hash)
      end
    end

    def parsed_value(value)
      return value unless value.is_a?(Hash)
      raise "Missing parse rule for #{value}" if value.keys.size > 1
      case value.keys.first
      when 'xsi:nil'
        return nil if value.values.first == 'true'
        false
      else
        false
      end
    end
  end
end

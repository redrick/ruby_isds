# rubocop:disable Metrics/ClassLength
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
                    dmQTimestamp dmAttachments dmAmbiguousRecipient].freeze

    attr_accessor(*ATTRIBUTES)

    def self.find(dmID)
      RubyIsds::WebServices::DmOperations::MessageDownload
        .call(dmID: dmID)
    end

    def download(destination = '/tmp')
      File.open("#{destination}/#{dmID}.zfo", 'wb') do |f|
        f.write(Base64.decode64(signed.body.dmSignature))
      end
    end

    def initialize(params = {})
      @params = params.dup
      status_info = @params.delete('dmDm')
      @dmAttachments = load_attachments
      @dmEvents = load_events
      unified_params = status_info ? status_info.merge(@params) : params
      unified_params.each do |key, value|
        raise "Not valid attribute of DataMessage #{key}" unless ATTRIBUTES.include?(key)
        instance_variable_set("@#{key}", parsed_value(value))
      end
    end

    def verify
      RubyIsds::WebServices::DmInfo::VerifyMessage
        .call(dmID: dmID)
    end

    def authenticate
      RubyIsds::WebServices::DmOperations::AuthenticateMessage
        .call(dmMessage: signed.body.dmSignature)
    end

    def signed
      RubyIsds::WebServices::DmOperations::SignedMessageDownload
        .call(dmID: dmID)
    end

    def author
      RubyIsds::WebServices::DmInfo::GetMessageAuthor
        .call(dmID: dmID)
    end

    def delivery_info
      RubyIsds::WebServices::DmInfo::GetDeliveryInfo
        .call(dmID: dmID)
    end

    def state_changes(options = {})
      RubyIsds::WebServices::DmInfo::GetMessageStateChanges
        .call(options)
    end

    def envelope
      RubyIsds::WebServices::DmInfo::MessageEnvelopeDownload
        .call(dmID: dmID)
    end

    def confirm_delivery
      RubyIsds::WebServices::DmInfo::ConfirmDelivery
        .call(dmID: dmID)
    end

    def mark_as_downloaded
      RubyIsds::WebServices::DmInfo::MarkMessageAsDownloaded
        .call(dmID: dmID)
    end

    def destroy(options = {})
      RubyIsds::WebServices::DmInfo::EraseMessage
        .call(options.merge(dmID: dmID))
    end

    def sent?
      dbIDSender == ::RubyIsds.configuration.data_box
    end

    def received?
      dbIDSender != ::RubyIsds.configuration.data_box
    end

    private

    def load_events
      return {} if @params['dmEvents'].blank?
      events_hash = @params.delete('dmEvents')['dmEvent']
      if events_hash.is_a?(Array)
        events_hash.map do |event|
          ::RubyIsds::Responses::Messages::Event.new(event)
        end
      else
        ::RubyIsds::Responses::Messages::Event.new(events_hash)
      end
    end

    def load_attachments
      return {} if @params['dmFiles'].blank?
      attachments_hash = @params.delete('dmFiles')['dmFile']
      if attachments_hash.is_a?(Array)
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
      if value.keys.first == 'xsi:nil' && value.values.first == 'true'
        nil
      else
        false
      end
    end
  end
end
# rubocop:enable Metrics/ClassLength

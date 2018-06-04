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
        nil if value.values.first == 'true'
        ''
      else
        ''
      end
      value
    end
  end
end

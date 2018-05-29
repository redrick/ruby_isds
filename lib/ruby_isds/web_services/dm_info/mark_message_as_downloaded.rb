module RubyIsds
  module WebServices
    module DmInfo
      class MarkMessageAsDownloaded < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = [:dmID]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].MarkMessageAsDownloaded {
            values(xml)
          }
        end
      end
    end
  end
end

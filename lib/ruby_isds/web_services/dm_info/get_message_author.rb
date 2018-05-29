module RubyIsds
  module WebServices
    module DmInfo
      class GetMessageAuthor < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = [:dmID]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].GetMessageAuthor {
            values(xml)
          }
        end
      end
    end
  end
end

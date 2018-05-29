module RubyIsds
  module WebServices
    module DmInfo
      class GetMessageStateChanges < ::RubyIsds::WebServices::DmInfo::Request
        ATTRS = [:dmFromTime, :dmToTime]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].GetMessageStateChanges {
            values(xml)
          }
        end
      end
    end
  end
end

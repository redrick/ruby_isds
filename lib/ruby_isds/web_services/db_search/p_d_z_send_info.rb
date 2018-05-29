module RubyIsds
  module WebServices
    module DbSearch
      class PDZSendInfo < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = [:dbId, :PDZType]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].PDZSendInfo {
            values(xml)
          }
        end
      end
    end
  end
end

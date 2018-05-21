module RubyIsds
  module WebServices
    module DbAccess
      class ChangeIsdsPassword < ::RubyIsds::Request
        ATTRS = [:dbOldPassword, :dbNewPassword]

        attr_accessor *ATTRS

        def body(xml)
          xml[:v20].ChangeISDSPassword {
            values(xml)
          }
        end

        def api_url
          '/DS/DsManage'
        end

        def xml_url
          "http://isds.#{RubyIsds.configuration.xml_url}/v20"
        end
      end
    end
  end
end

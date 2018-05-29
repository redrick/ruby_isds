module RubyIsds
  module WebServices
    module DbAccess
      class ChangeIsdsPassword < ::RubyIsds::WebServices::DbSearch::Request
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
      end
    end
  end
end

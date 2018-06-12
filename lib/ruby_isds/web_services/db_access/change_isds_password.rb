module RubyIsds
  module WebServices
    module DbAccess
      class ChangeIsdsPassword < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = %i[dbOldPassword dbNewPassword].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].ChangeISDSPassword do
            values(xml)
          end
        end

        def api_url
          '/DS/DsManage'
        end
      end
    end
  end
end

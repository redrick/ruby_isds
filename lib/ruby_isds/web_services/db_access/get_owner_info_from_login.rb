module RubyIsds
  module WebServices
    module DbAccess
      class GetOwnerInfoFromLogin < ::RubyIsds::WebServices::DbSearch::Request
        ATTRS = [].freeze

        attr_accessor(*ATTRS)

        def body(xml)
          xml[:v20].GetOwnerInfoFromLogin {}
        end

        def api_url
          '/DS/DsManage'
        end
      end
    end
  end
end

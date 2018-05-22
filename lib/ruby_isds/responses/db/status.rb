module RubyIsds
  module Responses
    module Db
      class Status < ::RubyIsds::Responses::Status
        private

        def namespace
          'db'
        end
      end
    end
  end
end

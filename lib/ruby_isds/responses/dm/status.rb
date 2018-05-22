module RubyIsds
  module Responses
    module Dm
      class Status < ::RubyIsds::Responses::Status
        private

        def namespace
          'dm'
        end
      end
    end
  end
end

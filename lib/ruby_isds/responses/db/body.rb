module RubyIsds
  module Responses
    module Db
      class Body < ::RubyIsds::Responses::Body
        REMOVED_KEYS = %w[xmlns:p xmlns:xsi dbStatus].freeze
      end
    end
  end
end

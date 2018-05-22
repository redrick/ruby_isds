module RubyIsds
  module Responses
    module Dm
      class Body < ::RubyIsds::Responses::Body
        REMOVED_KEYS = %w[xmlns:q xmlns:xsi dbStatus].freeze
      end
    end
  end
end

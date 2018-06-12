module RubyIsds
  module Responses
    class DataBox < Body
      REMOVED_KEYS = %w[xmlns:p xmlns:xsi dbStatus].freeze

      def initialize(response)
        (response.keys - REMOVED_KEYS).each do |key|
          self.class.send(:attr_accessor, key.to_sym)
          instance_variable_set("@#{key}", response[key])
        end
      end
    end
  end
end

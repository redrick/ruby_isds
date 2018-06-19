module RubyIsds
  module Responses
    class Body
      def initialize(response)
        (response.keys - self.class::REMOVED_KEYS).each do |key|
          self.class.send(:attr_accessor, key.to_sym)
          instance_variable_set("@#{key}", parsed_value(response[key]))
        end
      end

      private

      def parsed_value(value)
        return value unless value.is_a?(Hash)
        value.keys.first == 'xsi:nil' && value.values.first == 'true' ? nil : false
      end
    end
  end
end

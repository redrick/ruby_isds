module RubyIsds
  module Responses
    class Body
      def initialize(response)
        (response.keys - self.class::REMOVED_KEYS).each do |key|
          self.class.send(:attr_accessor, key.to_sym)
          instance_variable_set("@#{key}", response[key])
        end
      end
    end
  end
end

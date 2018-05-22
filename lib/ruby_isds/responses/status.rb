module RubyIsds
  module Responses
    class Status
      attr_accessor :code, :message

      def initialize(response)
        status = response["#{namespace}Status"]
        @code = status["#{namespace}StatusCode"]
        @message = status["#{namespace}StatusMessage"]
      end

      private

      def namespace
        raise NotImplementedError, "#{self.class} must implement #namespace!"
      end
    end
  end
end

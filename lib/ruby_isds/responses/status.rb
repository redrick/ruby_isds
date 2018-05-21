module RubyIsds
  module Responses
    class Status
      attr_accessor :code, :message

      def initialize(response)
        @code = response['dbStatusCode']
        @message = response['dbStatusMessage']
      end
    end
  end
end

module RubyIsds
  module Responses
    module Messages
      class Event < ::RubyIsds::Response
        attr_accessor :dmEventTime, :dmEventDescr

        def initialize(hash)
          @dmEventTime = hash['dmEventTime']
          @dmEventDescr = hash['dmEventDescr']
        end
      end
    end
  end
end

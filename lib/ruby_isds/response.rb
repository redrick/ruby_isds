module RubyIsds
  class Response
    attr_accessor :response

    def initialize(response)
      @response = Hash.from_xml(response.body)
    end

    def body
      @response['Envelope']['Body']
    end

    def status
      body[result_key]['dbStatus']
    end

    def result_key
      body.first[0]
    end
  end
end

module RubyIsds
  class Response
    attr_accessor :status, :body

    def initialize(response)
      @response = Hash.from_xml(response.body)
      @status = ::RubyIsds::Responses::Status.new(parsed_body['dbStatus'])
      @body = ::RubyIsds::Responses::Body.new(parsed_body)
    end

    def parsed_body
      @response['Envelope']['Body'][result_key]
    end

    def result_key
      @response['Envelope']['Body'].first[0]
    end
  end
end

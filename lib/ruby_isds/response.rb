module RubyIsds
  class Response
    attr_accessor :status, :body

    def initialize(response)
      @response = Hash.from_xml(response.body)
    end

    def parsed_body
      raise HtmlResponseReceived, @response.inspect unless @response['Envelope'].present?
      @response['Envelope']['Body'][result_key]
    end

    def result_key
      @response['Envelope']['Body'].first[0]
    end
  end
end

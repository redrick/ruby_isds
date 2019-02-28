module RubyIsds
  class Error < StandardError; end

  class ConfigNotSet < Error
    def initialize(param)
      msg = "Please check if you set #{param}, seems it is missing."
      super(msg)
    end
  end

  class HtmlResponseReceived < Error
    def initialize(param)
      msg = 'Please check if you set credentials correctly, '\
        "seems like a typo or something:\n #{param}"
      super(msg)
    end
  end
end

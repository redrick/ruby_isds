module RubyIsds
  class Configuration
    attr_writer :data_box, :username, :password, :env, :api_url

    ALLOWED_PRODUCTION_SYNTAX = [:production, 'production'].freeze

    def initialize
      @username = nil
      @password = nil
      @data_box = nil
      @env = nil
    end

    def data_box
      raise ConfigNotSet, 'data_box' unless @data_box
      @data_box
    end

    def username
      raise ConfigNotSet, 'username' unless @username
      @username
    end

    def password
      raise ConfigNotSet, 'password' unless @password
      @password
    end

    ##
    # env values:
    #   :development (default)
    #   :production
    #
    def env
      return :development unless @env
      @env
    end

    def api_domain
      return 'https://ws1.mojedatovaschranka.cz' if production?
      'https://ws1.czebox.cz'
    end

    def xml_url
      return 'mojedatovaschranka.cz' if production?
      'czechpoint.cz'
    end

    def production?
      ALLOWED_PRODUCTION_SYNTAX.include?(@env)
    end
  end
end

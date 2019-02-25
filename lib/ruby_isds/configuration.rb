module RubyIsds
  class Configuration
    attr_writer :data_box, :username, :password, :cert_file, :env, :api_url

    ALLOWED_PRODUCTION_SYNTAX = [:production, 'production'].freeze

    def initialize
      @username = nil
      @password = nil
      @data_box = nil
      @env = nil
      @cert_file = nil
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

    def cert_file
      return nil unless @cert_file
      # OpenSSL::X509::Certificate.new(File.read(@cert_file))
      # File.read(@cert_file)
      @cert_file
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
      if production?
        return 'https://ws1c.mojedatovaschranka.cz/cert' if @cert_file
        'https://ws1.mojedatovaschranka.cz'
      else
        return 'https://ws1c.czebox.cz/cert' if @cert_file
        'https://ws1.czebox.cz'
      end
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

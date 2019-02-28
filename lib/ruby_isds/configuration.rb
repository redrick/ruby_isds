module RubyIsds
  class Configuration
    attr_writer :data_box, :username, :password, :env, :api_url,
                :cert_file, :key_file, :pass_phrase
    attr_reader :pass_phrase

    ALLOWED_PRODUCTION_SYNTAX = [:production, 'production'].freeze

    def initialize
      @username = nil
      @password = nil
      @data_box = nil
      @env = nil
      @cert_file = nil
      @key_file = nil
      @pass_phrase = nil
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
      if @cert_file && (!@key_file && !@pass_phrase)
        raise ConfigNotSet, 'pass_phrase and key_file'
      end
      return unless @cert_file
      OpenSSL::X509::Certificate.new(File.read(@cert_file))
    end

    def key_file
      return nil unless @key_file
      File.read(@key_file)
    end

    def private_key
      raise ConfigNotSet, 'pass_phrase' if @key_file && !@pass_phrase
      raise ConfigNotSet, 'key_file' if !@key_file && @pass_phrase
      OpenSSL::PKey::RSA.new(File.read(@key_file), @pass_phrase)
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
        return 'https://ws1c.czebox.cz/hspis' if @cert_file
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

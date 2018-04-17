module RubyIsds
  class Configuration
    attr_writer :username, :password, :env, :api_url

    def initialize
      @username = nil
      @password = nil
      @env = nil
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
      case @env
      when :production then 'https://ws1c.mojedatovaschranka.cz'
      else 'https://ws1.czebox.cz'
      end
    end

    def xml_url
      case @env
      when :production then 'mojedatovaschranka.cz'
      else 'czechpoint.cz'
      end
    end
  end
end

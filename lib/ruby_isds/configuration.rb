module RubyIsds
  class Configuration
    attr_writer :data_box, :username, :password, :env, :api_url

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
      case @env
      when :production then 'https://ws1.mojedatovaschranka.cz'
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

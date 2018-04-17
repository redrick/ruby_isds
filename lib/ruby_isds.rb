require 'net/http'
require 'base64'
require 'nokogiri'

require 'ruby_isds/utils/errors'

require 'ruby_isds/version'
require 'ruby_isds/configuration'
require 'ruby_isds/request'

require 'ruby_isds/web_services/find_data_box'


module RubyIsds
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end

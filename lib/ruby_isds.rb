require 'net/http'
require 'base64'
require 'nokogiri'

require 'ruby_isds/version'
require 'ruby_isds/configuration'
require 'ruby_isds/request'

require 'ruby_isds/utils/errors'

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

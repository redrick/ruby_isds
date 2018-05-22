require 'net/http'
require 'base64'
require 'nokogiri'
require 'active_support/core_ext/hash'

require 'ruby_isds/utils/errors'

require 'ruby_isds/version'
require 'ruby_isds/configuration'
require 'ruby_isds/request'
require 'ruby_isds/response'

require 'ruby_isds/responses/body'
require 'ruby_isds/responses/status'
require 'ruby_isds/responses/db/status'
require 'ruby_isds/responses/dm/status'
require 'ruby_isds/responses/dm/body'
require 'ruby_isds/responses/db/body'
require 'ruby_isds/responses/message'
require 'ruby_isds/responses/messages/attachment'

require 'ruby_isds/web_services/db_access/change_isds_password'

require 'ruby_isds/web_services/db_search/response'
require 'ruby_isds/web_services/db_search/request'
require 'ruby_isds/web_services/db_search/find_data_box'
require 'ruby_isds/web_services/db_search/d_t_info'
require 'ruby_isds/web_services/db_search/get_data_box_activity_status'
require 'ruby_isds/web_services/db_search/check_data_box'
require 'ruby_isds/web_services/db_search/data_box_credit_info'
require 'ruby_isds/web_services/db_search/find_personal_data_box'
require 'ruby_isds/web_services/db_search/get_data_box_list'
require 'ruby_isds/web_services/db_search/isds_search_2'
require 'ruby_isds/web_services/db_search/p_d_z_info'
require 'ruby_isds/web_services/db_search/p_d_z_send_info'

require 'ruby_isds/web_services/dm_info/request'
require 'ruby_isds/web_services/dm_info/response'
require 'ruby_isds/web_services/dm_info/get_list_of_received_messages'
require 'ruby_isds/web_services/dm_info/confirm_delivery'

require 'ruby_isds/web_services/dm_operations/message_download'


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

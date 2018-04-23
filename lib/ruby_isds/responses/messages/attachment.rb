module RubyIsds
  module Responses
    module Messages
      class Attachment
        attr_accessor :file_type, :file_name, :encoded_content, :decoded_content

        def initialize(hash)
          @file_type = hash['dmMimeType']
          @file_name = hash['dmFileDescr']
          @encoded_content = hash['dmEncodedContent']
          @decoded_content = Base64.decode64(@encoded_content)
        end

        def download(destination = '/tmp')
          File.open("#{destination}/#{@file_name}", 'wb') do |f|
            f.write(@decoded_content)
          end
        end
      end
    end
  end
end

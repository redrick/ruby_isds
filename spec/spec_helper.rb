require 'bundler/setup'
require 'ruby_isds'

require 'support/vcr'
require 'pry'

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

require 'simplecov'
SimpleCov.start

# way to also load shared examples and what not..
Dir['./spec/support/**/*.rb'].sort.each { |f| require f }

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'

  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  RubyIsds.configure do |c|
    c.data_box = 'mxbf8u6'
    c.username = '8s53q2'
    c.password = 'n9y4BfM3tedosqHJ'
    c.env = :development
  end
end

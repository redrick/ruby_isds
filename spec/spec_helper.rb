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
end

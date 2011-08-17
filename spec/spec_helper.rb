require 'rubygems'
require 'bundler/setup'
require 'rspec/autorun'

RSpec.configure do |config|
  config.mock_with :rspec
end

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f }

require 'geonames'

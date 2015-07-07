require 'rack/test'
require 'rspec'
require 'factory_girl'

require File.expand_path("../../tempest_watch.rb", __FILE__)

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

# Factory Girl
FactoryGirl.definition_file_paths = %w{./factories ./test/factories ./spec/factories}
FactoryGirl.find_definitions

ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'rack/test'

describe "TempestWatch" do
    include Rack::Test::Methods

  def app
    TempestWatch
  end

  it "should allow accessing the home page" do
    get '/'
    expect(last_response).to be_ok
  end
end

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

  describe "API TempestsController" do
    it "should respond to GET /" do
      get '/api/v0/tempests'
      expect(last_response).to be_ok
    end

    it "should return the list of tempests" do
      get '/api/v0/tempests'
      parsed_body = JSON.parse(last_response.body)
      expect(parsed_body['bases']['obscuring']['name']).to be == 'Obscuring Tempest' # Quick and dirty test, brittle if data changes
    end
  end
end

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

    describe "GET /api/v0/tempests" do
      before(:all) do
        get '/api/v0/tempests'
        @parsed_body = JSON.parse(last_response.body)
      end

      it "should respond to GET /" do
        expect(last_response).to be_ok
      end

      it "should return the list of base tempests" do
        expect(@parsed_body['bases'].empty?).to be(false)
      end

      it "should have a name for each tempest" do
        @parsed_body['bases'].each do |name, tempest|
          expect(tempest['name']).to_not be_nil
        end
      end

      it "should return the list of tempest prefixes" do
        expect(@parsed_body['prefixes'].empty?).to be(false)
      end

      it "should return the list of tempest suffixes" do
        expect(@parsed_body['suffixes'].empty?).to be(false)
      end
    end
  end
end

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

      it "should return the list of tempest suffixes" do
        expect(@parsed_body['suffixes'].empty?).to be(false)
      end
    end

    describe "GET /api/v0/current_tempests" do
      before(:all) do
        get '/api/v0/current_tempests'
        @parsed_body = JSON.parse(last_response.body)
        @test_map = 'crypt'
      end

      it "should respond to GET /" do
        expect(last_response).to be_ok
      end

      it "should have the name of active tempests" do
        expect(@parsed_body[@test_map]['name']).to_not be_nil
      end

      it "should have the base of active tempests" do
        expect(@parsed_body[@test_map]['base']).to_not be_nil
      end

      it "should have the suffix of active tempests" do
        expect(@parsed_body[@test_map]['suffix']).to_not be_nil
      end

      it "should not have anything else" do
        expect(@parsed_body[@test_map].keys.length).to eq(3)
      end
    end

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

      it "should return the list of tempest suffixes" do
        expect(@parsed_body['suffixes'].empty?).to be(false)
      end
    end

    describe "GET /api/v1/current_tempests" do
      before(:all) do
        get '/api/v1/current_tempests'
        @parsed_body = JSON.parse(last_response.body)
        @test_map = 'crypt'
      end

      it "should respond to GET /" do
        expect(last_response).to be_ok
      end

      it "should have the name of active tempests" do
        expect(@parsed_body[@test_map]['name']).to_not be_nil
      end

      it "should have the base of active tempests" do
        expect(@parsed_body[@test_map]['base']).to_not be_nil
      end

      it "should have the suffix of active tempests" do
        expect(@parsed_body[@test_map]['suffix']).to_not be_nil
      end

      it "should have the number of votes of active tempests" do
        expect(@parsed_body[@test_map]['votes']).to_not be_nil
      end

      it "should have the type of active tempests" do
        expect(@parsed_body[@test_map]['type']).to_not be_nil
      end

      it "should not have anything else" do
        expect(@parsed_body[@test_map].keys.length).to eq(5)
      end
    end

    describe "GET /api/v1/current_tempests/:map_name" do
      before(:all) do
        get '/api/v1/current_tempests/crypt'
        @parsed_body = JSON.parse(last_response.body)
      end

      it "should respond to GET /" do
        expect(last_response).to be_ok
      end

      it "should have the name of active tempests" do
        expect(@parsed_body['name']).to_not be_nil
      end

      it "should have the base of active tempests" do
        expect(@parsed_body['base']).to_not be_nil
      end

      it "should have the suffix of active tempests" do
        expect(@parsed_body['suffix']).to_not be_nil
      end

      it "should have the number of votes of active tempests" do
        expect(@parsed_body['votes']).to_not be_nil
      end

      it "should have the type of active tempests" do
        expect(@parsed_body['type']).to_not be_nil
      end

      it "should not have anything else" do
        expect(@parsed_body.keys.length).to eq(5)
      end
    end
  end
end

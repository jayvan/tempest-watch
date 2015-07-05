require 'haml'
require 'json'
require 'redis'
require 'sinatra'

require './map.rb'
require './tempest.rb'

class TempestWatch < Sinatra::Base
  configure do
    $redis = Redis.new
  end

  helpers do
    # Returns the number of seconds left until tempests move
    def seconds_to_reset
      (59 - Time.now.min) * 60 + (60 - Time.now.sec)
    end

    def titleize(name)
      name.split('_').map(&:capitalize).join(' ')
    end

    # Returns the current tempests for all maps
    def current_tempests
      cur_tempests = Map.get_all.map do |map|
        [map.name, map.tempest]
      end

      return Hash[cur_tempests]
    end
  end

  get '/' do
    @maps = Map.get_all
    @tempests = Tempest::BASES
    haml :index
  end

  post '/api/vote' do
    map = Map.get(params[:map])
    if map.nil?
      status 400
      body "Map #{params[:map]} does not exist"
    elsif Tempest.get(params[:tempest]).nil?
      status 400
      body "Tempest #{params[:tempest]} does not exist"
    else
      map.report_tempest(params[:tempest])
      200
    end
  end

  get '/api/tempests' do
    return current_tempests.to_json
  end

  get '/api/tempests/:map' do
    map = Map.get(params[:map])
    if map.nil?
      status 400
      body "Map #{params[:map]} does not exist"
    else
      status 200
      body map.tempest.to_json
    end
  end
end

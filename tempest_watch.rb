require 'haml'
require 'json'
require 'redis'
require 'sinatra'
require "sinatra/namespace"

require './map.rb'
require './tempest.rb'

class TempestWatch < Sinatra::Base
 register Sinatra::Namespace

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
    @tempest_bases = Tempest::BASES
    @tempest_prefixes = Tempest::PREFIXES
    @tempest_suffixes = Tempest::SUFFIXES
    haml :index
  end

  namespace '/api/v0' do
    post '/vote' do
      map = Map.get(params[:map])
      if map.nil?
        status 400
        body "Map #{params[:map]} does not exist"
      elsif Tempest::BASES[params[:base]].nil?
        status 400
        body "Tempest #{params[:base]} does not exist"
      elsif params[:prefix] && Tempest::PREFIXES[params[:prefix]].nil?
        status 400
        body "Prefix #{params[:prefix]} does not exist"
      elsif params[:suffix] && Tempest::SUFFIXES[params[:suffix]].nil?
        status 400
        body "Suffix #{params[:suffix]} does not exist"
      else
        tempest = Tempest.new(params[:base], params[:prefix], params[:suffix])
        map.report_tempest(tempest)
        200
      end
    end

    get '/tempests' do
      return {
        bases: Tempest::BASES,
        prefixes: Tempest::PREFIXES,
        suffixes: Tempest::SUFFIXES
      }.to_json
    end

    get '/maps' do
      Map::LEVELS.to_json
    end

    get '/current_tempests' do
      return current_tempests.to_json
    end

    get '/current_tempests/:map' do
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
end

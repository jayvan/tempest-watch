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
    enable :logging
    file = File.new("#{settings.root}/log/#{settings.environment}.log", 'a+')
    file.sync = true
    use Rack::CommonLogger, file
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
    @tempest_suffixes = Tempest::SUFFIXES
    haml :index
  end
end

require_relative 'api_v0'
require_relative 'api_v1'

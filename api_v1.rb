class TempestWatch < Sinatra::Base
  namespace '/api/v1' do
    post '/vote' do
      map = Map.get(params[:map])
      if map.nil?
        status 400
        body "Map #{params[:map]} does not exist"
      elsif Tempest::BASES[params[:base]].nil?
        status 400
        body "Tempest #{params[:base]} does not exist"
      elsif params[:suffix] && Tempest::SUFFIXES[params[:suffix]].nil?
        status 400
        body "Suffix #{params[:suffix]} does not exist"
      else
        skip_validation = params[:api_key] && ($redis.exists "apikey::#{params[:api_key]}")
        if params[:api_key] && !skip_validation
          status 400
          body "Invalid api key: #{params[:api_key]}"
          return
        end

        tempest = Tempest.new(params[:base], params[:suffix])
        map.report_tempest(tempest, request.ip, seconds_to_reset, skip_validation)
        200
      end
    end

    get '/tempests' do
      return {
        bases: Tempest::BASES,
        suffixes: Tempest::SUFFIXES
      }.to_json
    end

    get '/maps' do
      Map::LEVELS.to_json
    end

    get '/current_tempests' do
      status 200
      tempests = {}
      current_tempests.each do |map, tempest|
        tempests[map] = {
          name: tempest.name,
          base: tempest.base,
          suffix: tempest.suffix,
          votes: tempest.votes,
          type: tempest.type
        }
      end
      body tempests.to_json
    end

    get '/current_tempests/:map' do
      map = Map.get(params[:map])
      if map.nil?
        status 400
        body "Map #{params[:map]} does not exist"
      else
        status 200
        body map.tempest.to_json(with_votes: true, with_type: true)
      end
    end
  end
end

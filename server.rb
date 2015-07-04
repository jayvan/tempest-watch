require 'haml'
require 'json'
require 'redis'
require 'sinatra'

configure do
  $redis = Redis.new
end

helpers do
  def titleize (title)
    title.to_s.split('_').map(&:capitalize).join(' ')
  end

  def tempest_for_map(map)
    tempest_name = $redis.zrevrangebyscore(map, '+inf', '-inf', :limit => [0, 1])[0]
    tempest_name ||= 'unknown'
    return TEMPESTS[tempest_name]
  end

  def all_tempests
    tempests = MAPS.map do |name, level|
      [name, tempest_for_map(name)]
    end

    return Hash[tempests]
  end
end

get '/' do
  @maps = MAPS
  @tempests = TEMPESTS
  @active_tempests = all_tempests
  haml :index
end

post '/api/vote' do
  if MAPS[params[:map]].nil?
    status 400
    body "Map #{params[:map]} does not exist"
  elsif TEMPESTS[params[:tempest]].nil?
    status 400
    body "Tempest #{params[:tempest]} does not exist"
  else
    $redis.zincrby(params[:map], 1, params[:tempest])
    200
  end
end

get '/api/tempests' do
  return all_tempests.to_json
end

get '/api/tempests/:location' do
  tempest = tempest_for_map(params[:location])
  return tempest.to_json
end

TEMPESTS = {
  'unknown' => {
    name: 'Unknown',
    message: 'If you enter this map please report which tempest is active'
  },
  'none' => {
    name: 'None',
    message: 'No tempest is active in this area'
  },
  'bounty' => {
    name: 'Tempest of Bounty',
    monster_bonus: '50% increased number of items dropped',
    player_bonus: '50% increased rarity of items obtained'
  },
  'fire' => {
    name: 'Tempest of Fire',
    monster_bonus: 'Monsters deal 55% additional damage as fire',
    player_bonus: '55% increased resistance to fire damage'
  },
  'water' => {
    name: 'Tempest of Water',
    monster_bonus: 'Monsters deal 55% additional damage as water',
    player_bonus: '55% increased resistance to water damage'
  }
}

# Key = Map name with spaces converted to underscores
# Value = Map level
MAPS = {
  'crypt' => 66,
  'dried_lake' => 66,
  'dunes' => 66,
  'dungeon' => 66,
  'grotto' => 66,
  'overgrown_ruin' => 66,
  'tropical_island' => 66,
  'arcade' => 67,
  'arsenal' => 67,
  'cemetery' => 67,
  'mountain_ledge' => 67,
  'sewer' => 67,
  'thicket' => 67,
  'wharf' => 67,
  'ghetto' => 68,
  'mud_geyser' => 68,
  'reef' => 68,
  'spider_lair' => 68,
  'springs' => 68,
  'vaal_pyramid' => 68,
  'catacomb' => 69,
  'overgrown_shrine' => 69,
  'promenade' => 69,
  'shore' => 69,
  'spider_forest' => 69,
  'tunnel' => 69,
  'bog' => 70,
  'coves' => 70,
  'graveyard' => 70,
  'pier' => 70,
  'underground_sea' => 70,
  'arachnid_nest' => 71,
  'colonnade' => 71,
  'dry_woods' => 71,
  'strand' => 71,
  'temple' => 71,
  'jungle_valley' => 72,
  'torture_chamber' => 72,
  'waste_pool' => 72,
  'mine' => 72,
  'dry_peninsula' => 73,
  'canyon' => 73,
  'cells' => 73,
  'dark_forest' => 73,
  'gorge' => 74,
  'maze' => 74,
  'underground_river' => 74,
  'bazaar' => 75,
  'necropolis' => 75,
  'plateau' => 75,
  'crematorium' => 76,
  'precinct' => 76,
  'shipyard' => 77,
  'shrine' => 77
}

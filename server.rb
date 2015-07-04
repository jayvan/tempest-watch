require 'haml'
require 'json'
require 'sinatra'

helpers do
  def titleize (title)
    title.to_s.split('_').map(&:capitalize).join(' ')
  end
end

get '/' do
  @maps = MAPS
  @tempests = TEMPESTS
  haml :index
end

post '/api/vote' do
  200
end

get '/api/tempests' do
  200
end

get '/api/tempests/:location' do
  200
end

TEMPESTS = {
  unknown: {
    name: 'Unknown',
    monster_bonus: 'If you enter this map please report which tempest is active',
    player_bonus: ''
  },
  none: {
    name: 'None',
    monster_bonus: 'No tempest is active in this area',
    player_bonus: ''
  },
  bounty: {
    name: 'Tempest of Bounty',
    monster_bonus: '50% increased number of items dropped',
    player_bonus: '50% increased rarity of items obtained'
  },
  fire: {
    name: 'Tempest of Fire',
    monster_bonus: 'Monsters deal 55% additional damage as fire',
    player_bonus: '55% increased resistance to fire damage'
  },
  water: {
    name: 'Tempest of Water',
    monster_bonus: 'Monsters deal 55% additional damage as water',
    player_bonus: '55% increased resistance to water damage'
  }
}

# Key = Map name with spaces converted to underscores
# Value = Map level
MAPS = {
  crypt: 66,
  dried_lake: 66,
  dunes: 66,
  dungeon: 66,
  grotto: 66,
  overgrown_ruin: 66,
  tropical_island: 66,
  arcade: 67,
  arsenal: 67,
  cemetery: 67,
  mountain_ledge: 67,
  sewer: 67,
  thicket: 67,
  wharf: 67,
  ghetto: 68,
  mud_geyser: 68,
  reef: 68,
  spider_lair: 68,
  springs: 68,
  vaal_pyramid: 68,
  catacomb: 69,
  overgrown_shrine: 69,
  promenade: 69,
  shore: 69,
  spider_forest: 69,
  tunnel: 69,
  bog: 70,
  coves: 70,
  graveyard: 70,
  pier: 70,
  underground_sea: 70,
  arachnid_nest: 71,
  colonnade: 71,
  dry_woods: 71,
  strand: 71,
  temple: 71,
  jungle_valley: 72,
  torture_chamber: 72,
  waste_pool: 72,
  mine: 72,
  dry_peninsula: 73,
  canyon: 73,
  cells: 73,
  dark_forest: 73,
  gorge: 74,
  maze: 74,
  underground_river: 74,
  bazaar: 75,
  necropolis: 75,
  plateau: 75,
  crematorium: 76,
  precinct: 76,
  shipyard: 77,
  shrine: 77
}

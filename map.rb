require './tempest.rb'

class Map
  attr_accessor :name, :level

  def self.get(name)
    return nil if LEVELS[name].nil?
    return Map.new(name, LEVELS[name])
  end

  def self.get_all
   LEVELS.map do |name, level|
     Map.new(name, level)
   end
  end

  def initialize(name, level)
    @name = name
    @level = level
  end

  def redis_key
    "#{@name}_#{Time.now.utc.hour}"
  end

  def tempest
    tempest_name = $redis.zrevrangebyscore(redis_key, '+inf', '2', :limit => [0, 1])[0]
    tempest_name ||= 'unknown'
    Tempest.get(tempest_name)
  end

  # Add a vote for the tempest being active on the given map
  # Increments the tempests counter in the maps SortedSet
  def report_tempest(tempest)
    key = redis_key
    $redis.zincrby(key, 1, tempest)
    $redis.expire(key, 3600)
  end

  LEVELS = {
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
end

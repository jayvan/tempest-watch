class Tempest
  def self.get(name)
    return BASES[name]
  end

  BASES = {
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
end

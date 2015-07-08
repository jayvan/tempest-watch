class Tempest
  attr_accessor :name, :description, :base_name, :prefix_name, :suffix_name

  def initialize(base, prefix, suffix)
    @base_name = base || 'unknown'
    @prefix_name = prefix || 'none'
    @suffix_name = suffix || 'none'
    @base = BASES[base] || UNKNOWN_BASE
    @prefix = PREFIXES[@prefix_name]
    @suffix = SUFFIXES[@suffix_name]

    @name = @base[:name]
    @name = "#{@prefix_name.capitalize} #{@name}" if @prefix_name != 'none'
    @name = "#{@name} of #{@suffix_name.capitalize}" if @suffix_name != 'none'

    if @base[:message]
      @description = @base[:message]
    else
      @description = [@base[:player_bonus], @base[:monster_bonus], @prefix, @suffix].compact.join(', ')
    end
  end

  def to_json(options = nil)
    return {
      name: @name,
      base: @base,
      prefix: @prefix,
      suffix: @suffix
    }.to_json(options)
  end

  UNKNOWN_BASE = {
    name: 'Unknown',
    message: 'If you enter this map please report which tempest is active'
  }

  BASES = {
    'none' => {
      name: 'None',
      message: 'No tempest is active in this area'
    },
    'abyssal' => {
      name: 'Abyssal Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'arctic' => {
      name: 'Arctic Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'battering' => {
      name: 'Battering Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'blasphemous' => {
      name: 'Blasphemous Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'brisk' => {
      name: 'Brisk Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'consuming' => {
      name: 'Consuming Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'corrupting' => {
      name: 'Corrupting Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'crushing' => {
      name: 'Crushing Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'divine' => {
      name: 'Divine Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'echoing' => {
      name: 'Echoing Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'electrocuting' => {
      name: 'Electrocuting Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'energising' => {
      name: 'Energising Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'enlarging' => {
      name: 'Enlarging Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'ethereal' => {
      name: 'Ethereal Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'freezing' => {
      name: 'Freezing Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'galvanizing' => {
      name: 'Galvanizing Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'gathering' => {
      name: 'Gathering Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'ghastly' => {
      name: 'Ghastly Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'glacial' => {
      name: 'Glacial Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'impure' => {
      name: 'Impure Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'infernal' => {
      name: 'Infernal Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'molten' => {
      name: 'Molten Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'morbid' => {
      name: 'Morbid Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'obscuring' => {
      name: 'Obscuring Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'quickening' => {
      name: 'Quickening Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'radiating' => {
      name: 'Radiating Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'refining' => {
      name: 'Refining Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'restorative' => {
      name: 'Restorative Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'scathing' => {
      name: 'Scathing Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'seething' => {
      name: 'Seething Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'sharding' => {
      name: 'Sharding Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'shielding' => {
      name: 'Shielding Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'shimmering' => {
      name: 'Shimmering Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'shining' => {
      name: 'Shining Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'shivering' => {
      name: 'Shivering Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'shrinking' => {
      name: 'Shrinking Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'static' => {
      name: 'Static Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'stinging' => {
      name: 'Stinging Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'transmogrifying' => {
      name: 'Transmogrifying Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    },
    'veiling' => {
      name: 'Veiling Tempest',
      player_bonus: 'Unknown effect',
      monster_bonus: ''
    }
  }

  PREFIXES = {
    'none' => ''
  }

  SUFFIXES = {
    'none' => '',
    'aberrance' => 'Unknown suffix effect',
    'animation' => 'Tempest strikes animate nearby weapons',
    'catalysm' => 'Unknown suffix effect',
    'desperation' => 'Unknown suffix effect',
    'destiny' => 'Unknown suffix effect',
    'fate' => 'Unknown suffix effect',
    'fire' => 'Tempest strikes leave burning ground',
    'fortune' => 'Unknown suffix effect',
    'ice' => 'Tempest strikes leave chilling ground',
    'influence' => 'Unknown suffix effect',
    'inspiration' => 'Unknown suffix effect',
    'intensity' => 'Unknown suffix effect',
    'lightning' => 'Tempest strikes leave shocking ground',
    'phantoms' => 'Tempest strikes turn nearby corpses into apparitions',
    'poison' => 'Tempest strikes leave a poison cloud',
    'precision' => 'Unknown suffix effect',
    'revelation' => 'Unknown suffix effect',
    'the_ancestors' => 'Tempest strikes summon totems',
    'turmoil' => 'Unknown suffix effect'
  }
end

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
    'static' => {
      name: 'Static Tempest',
      monster_bonus: '25% decreased lightning resistance',
      player_bonus: '25% increased lightning damage'
    },
    'obscuring' => {
      name: 'Obscuring Tempest',
      monster_bonus: 'Monsters are blinded for 3 seconds',
      player_bonus: 'Players are blinded for 3 seconds'
    },
    'scathing' => {
      name: 'Scathing Tempest',
      monster_bonus: 'Monsters deal 50% increased critical damage',
      player_bonus: 'Players receive 50% increased critical damage'
    }
  }

  PREFIXES = {
    'none' => '',
    'jumbo' => '50% increased area of effect for tempests',
    'mini' => '50% decreased area of effect for tempests'
  }

  SUFFIXES = {
    'none' => '',
    'intensity' => '50% increased duration of tempests',
    'mediocrity' => '50% decreased duration of tempests',
  }
end

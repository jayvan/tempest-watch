class Tempest
  attr_accessor :name, :description, :base_name, :suffix_name

  def initialize(base, suffix)
    @base_name = base || 'unknown'
    @suffix_name = suffix || 'none'
    @base = BASES[base] || UNKNOWN_BASE
    @suffix = SUFFIXES[@suffix_name]

    @name = @base_name.capitalize
    @name = "#{@name} Tempest" if @name != 'None'
    @name = "#{@name} of #{@suffix_name.capitalize}" if @suffix_name != 'none'

    @description = "#{@base}. #{@suffix}"
  end

  def to_json(options = nil)
    return {
      name: @name,
      base: @base,
      suffix: @suffix
    }.to_json(options)
  end

  def type
    if %w(radiating shining corrupting).include? @base_name
      'great'
    elsif %w(destiny fate fortune phantoms radiating revelation turmoil).include? @suffix_name
      'great'
    elsif %w(abyssal veiling).include? @base_name
      'dangerous'
    elsif %w(aberrance).include? @suffix_name
      'dangerous'
    else
      ''
    end
  end

  UNKNOWN_BASE = 'If you enter this map please report which tempest is active'

  BASES = {
    'none' => 'No tempest is active in this area',
    'abyssal' => '100% of damage is converted to chaos damage',
    'arctic' => 'Casts various ice spells',
    'battering' => 'Casts various physical spells',
    'blasphemous' => 'Casts curses',
    'brisk' => '25% chance to dodge atacks, 25% chance to dodge spell damage',
    'corrupting' => 'Corrupted drops',
    'crushing' => 'Casts various physical spells',
    'divine' => 'Cannot be damaged',
    'echoing' => 'Skills repeat an additional time',
    'electrocuting' => 'Casts various lightning spells',
    'energising' => 'Gain charges',
    'enlarging' => '30% increased character size, 30% increased maximum life, 50% increased damage',
    'ethereal' => 'Your movement is not blocked by enemies, 25% chance to dodge attacks, 25% chance to dodge spell damage',
    'freezing' => 'Tempests cause freeze',
    'galvanizing' => '50% of physical damage converted to lightning damage, 50% increase lightning damage, always shock',
    'ghastly' => 'Summons skeletons, raising spirits, and casts desecrate',
    'glacial' => 'Casts various cold spells',
    'impure' => 'Taking elemental damage heals you instead',
    'infernal' => 'Casts various fire spells',
    'molten' => 'Casts various fire spells',
    'morbid' => 'Summons vaal skeletons, raging spirits, and casts desecrate',
    'obscuring' => 'Creates a cloud of smoke that blinds enemies and gives a temporary buff to movement speed',
    'quickening' => '30% increased attack speed, 30% increased cast speed, 30% increased movement speed',
    'radiating' => '1200% increased rarity of items found, 600% increased quantity of items found',
    'refining' => 'Quality drops',
    'restorative' => '10% of Mana Regenerated per second, 10% of Life regenerated per second',
    'scathing' => 'All hits are Critical Strikes, extra gore',
    'seething' => '50% of physical damage converted to fire damage, 50% increased fire damage, always ignite',
    'sharding' => '4 additional projectiles, 30%increased radius of area skills',
    'shielding' => 'Grants a proximity shield that blocks projectiles',
    'shimmering' => '+1000 to maximum energy shield, energy shield recharge not delayed by damage',
    'shining' => '600% increased rarity of items found, 300% increase quantity of items found',
    'shivering' => '50% of physical damage converted to cold damage, 50% increased cold damage, always freeze',
    'shrinking' => '30% reduced character size, 30% reduced maximum life, 50% reduced damage',
    'static' => 'Casts shock nova, lightning storm, ball lightning, and summons storms',
    'stinging' => 'All hits are Critical Strikes',
    'transmogrifying' => 'Drops items as their sell price',
    'veiling' => 'Elemental resistances are zero, 40% reduced light radius',
  }

  SUFFIXES = {
    'none' => '',
    'aberrance' => 'Rare monsters each have a nemesis mod, magic monster packs each have a bloodline mod',
    'angling' => '50% increased fish school size',
    'animation' => 'Nearby weapons are animated',
    'catalysm' => '50% reduced tempest lifetime, 40% increased tempst frequency',
    'desperation' => '40% increased tempest buff duration when on low life',
    'destiny' => 'Random monster drops a map',
    'fate' => 'Random monster drops a vaal fragment',
    'fire' => 'Area has patches of burning ground, +25% monster fire resistance',
    'fortune' => 'Random monster drops a unique item',
    'ice' => 'Area has patched of chilled ground, +25% monster cold resistance',
    'influence' => '50% increased tempest area of effect',
    'inspiration' => '15% increased experience gian',
    'intensity' => '35% increased tempest frequency, 25% reduced tempest buff duration',
    'lightning' => 'Area has patches of shocking ground, +25% monster lightning resistance',
    'phantoms' => 'Area is haunted by 10 additional tormented spirits',
    'poison' => 'Area has patches of desecrated ground, monsters poison on hit',
    'precision' => '30% reduced tempest area of effect, 25% increased tempest frequency',
    'revelation' => '50% increased experience gain',
    'the_ancestors' => 'Area contains many totems',
    'turmoil' => 'Area is inhabited by 20 additional rogue exiles'
  }
end

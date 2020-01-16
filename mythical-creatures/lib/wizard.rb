class Wizard
  attr_reader :name, :bearded, :rested, :spell_count
  attr_writer :rested, :spell_count
  def initialize(name, bearded: true, rested: true)
    @name = name
    @bearded = bearded
    @rested = rested
    @spell_count = 0
  end

  def bearded?
    self.bearded
  end

  def incantation(power)
    "sudo #{power}"
  end

  def rested?
    if self.spell_count < 3
      self.rested = true
    else
      self.rested = false
    end

  end

  def cast(spell)
    self.spell_count += 1
    "#{spell.upcase}!"
  end

end

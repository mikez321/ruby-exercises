class Wizard
  attr_reader :name, :bearded, :rested, :spell_count
  def initialize(name, bearded: true)
    @name = name
    @bearded = bearded
    @rested = true
    @spell_count = 0
  end

  def bearded?
    bearded
  end

  def incantation(command)
    "sudo #{command}"
  end

  def rested?
    rested
  end

  def cast(spell)
    @spell_count += 1
    return @rested = false if spell_count >= 3
    "#{spell.upcase}!"
  end

end

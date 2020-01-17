class Medusa
  attr_reader :name, :statues
  attr_writer :statues
  def initialize(name, statues = [])
    @name = name
    @statues = statues
  end

  def stare(victim)
    self.statues << victim
    victim.stoned = true
    if statues.count > 3
      statues[0].stoned = false
      statues.shift
    end

  end

end


class Person
  attr_reader :name, :stoned
  attr_writer :stoned
  def initialize(name, stoned: false)
    @name = name
    @stoned = stoned
  end

  def stoned?
    self.stoned
  end

end

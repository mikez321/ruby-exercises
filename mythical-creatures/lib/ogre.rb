class Ogre
  attr_reader :name, :home, :swings, :encounter_counter
  def initialize(name, home = "Swamp")
    @name = name
    @home = home
    @encounter_counter = 0
    @swings = 0
  end

  def encounter(human)
    @encounter_counter += 1
    human.encounters_ogre
    swing_at(human) if human.notices_ogre?
  end

  def swing_at(human)
    @swings += 1
    human.knocked_out = true if swings % 2
  end

  def apologize(human)
    human.knocked_out = false
  end

end

class Human
  attr_reader :name, :encounter_counter, :knocked_out
  attr_writer :knocked_out
  def initialize(name = "Jane")
    @name = name
    @encounter_counter = 0
    @knocked_out = false
  end

  def encounters_ogre
    @encounter_counter += 1
  end

  def notices_ogre?
    return true if encounter_counter % 3 == 0
  end

  def knocked_out?
    knocked_out
  end

end

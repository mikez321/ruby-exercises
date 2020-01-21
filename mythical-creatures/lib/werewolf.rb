class Werewolf
  attr_reader :name, :location, :human, :hungry
  def initialize(name, location = "Cave")
    @name = name
    @location = location
    @human = true
    @hungry = false
  end

  def human?
    human
  end

  def change!
    @human = !human
    @hungry = !hungry
  end

  def wolf?
    !human
  end

  def hungry?
    hungry
  end

  def consume!(victim)
    if human
      "I'm not gonna eat that guy"
    elsif !human
      victim.status = "dead"
      @hungry = false
      "Nom Nom Nom"
    end
  end

end

class Centaur
  attr_reader :name, :breed, :cranky, :standing, :action_count, :sick
  def initialize(name, breed = "Palomino")
    @name = name
    @breed = breed
    @cranky = false
    @standing = true
    @action_count = 0
    @sick = false
  end

  def shoot
    action_reaction
    return "NO!" unless ready_for_action
    "Twang!!!"
  end

  def run
    action_reaction
    return "NO!" unless ready_for_action
    "Clop clop clop clop!!!"
  end

  def action_reaction
    @action_count += 1
    @cranky = true if action_count >= 3
  end

  def ready_for_action
    !cranky && standing
  end

  def cranky?
    cranky
  end

  def sick?
    sick
  end

  def standing?
    standing
  end

  def laying?
    !standing
  end

  def lay_down
    @standing = false
  end

  def stand_up
    @standing = true
  end

  def sleep
    return "NO!" if standing
    @action_count = 0
    @cranky = false
  end

  def drink_potion
    return "NO!" if !standing
    return @sick = true if !cranky
    @cranky = false
    @action_count = 0
  end

end

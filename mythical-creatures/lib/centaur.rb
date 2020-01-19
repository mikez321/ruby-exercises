class Centaur
  attr_reader :name, :breed, :cranky, :standing, :action_count
  attr_writer :cranky, :standing, :action_count
  def initialize(name, breed, cranky: false, standing: true, action_count: 0)
    @name = name
    @breed = breed
    @cranky = cranky
    @standing = standing
    @action_count = action_count
  end

  def shoot
    if self.cranky
      "NO!"
    else
      self.action_count += 1
      "Twang!!!"
    end
  end

  def run
    self.action_count += 1
    "Clop clop clop clop!!!"
  end

  def cranky?
    if self.action_count >= 3
      self.cranky = true
    else
      self.cranky = false
    end
  end

  def standing?
    self.standing
  end

end

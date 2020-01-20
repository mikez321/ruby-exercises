class Centaur
  attr_reader :name, :breed, :cranky, :standing, :action_count, :laying, :sick
  attr_writer :cranky, :standing, :action_count, :laying, :sick
  def initialize(name, breed, cranky: false, standing: true, action_count: 0)
    @name = name
    @breed = breed
    @cranky = cranky
    @standing = standing
    @action_count = action_count
    @laying = laying
    @sick = false
  end

  def shoot
    self.action_count += 1
    if action_count >= 3
      self.cranky = true
    end

    if self.cranky || self.laying
      "NO!"
    else
      "Twang!!!"
    end
  end

  def run
    self.action_count += 1
    if action_count >= 3
      self.cranky = true
    end

    if self.cranky || self.laying
      "NO!"
    else
      "Clop clop clop clop!!!"
    end
  end

  def cranky?
    self.cranky
  end

  def standing?
    self.standing
  end

  def laying?
    self.laying
  end

  def lay_down
    self.standing = false
    self.laying = true
  end

  def stand_up
    self.standing = true
    self.laying = false
  end

  def sleep
    if self.standing
      "NO!"
    else
      self.action_count = 0
      self.cranky = false
    end
  end

  def sick?
    self.sick
  end

  def drink_potion
    if action_count == 0
      self.sick = true
    elsif self.standing
      self.action_count = 0
      self.cranky = false
    elsif !self.standing
      "NO!"
    end
  end


end

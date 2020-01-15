class Dragon
  attr_accessor :name, :color, :rider, :hungry, :meal
  def initialize(name, color, rider)
    @name = name
    @color = color
    @rider = rider
    @hungry = true
    @meal = 0
  end

  def hungry?
    hungry
  end

  def eat
    self.meal += 1
    if self.meal == 3
      self.hungry = false
    else
      self.hungry = true
    end
  end

end

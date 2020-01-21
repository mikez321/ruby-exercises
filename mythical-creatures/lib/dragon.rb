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
    @meal += 1
    @hungry = false if meal >= 3
  end

end

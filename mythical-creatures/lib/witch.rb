class Witch
  attr_reader :name, :home, :chef, :lesson_count, :stolen_kids
  def initialize(name, home = "The Woods")
    @name = name
    @home = home
    @chef = false
    @lesson_count = 0
    @stolen_kids = []
  end

  def chef?
    chef
  end

  def take_lessons
    @lesson_count += 1
    return @chef = true if lesson_count >= 5
  end

  def make_food(food)
    food.type = "Delicious" if chef
  end

  def kidnap(kid)
    return @stolen_kids << kid if kid.like_food
  end

  def eat_kid!(kid)
    if stolen_kids.include?(kid)
      @lesson_count = 0
      @chef = false
      kid.like_food = false
      @stolen_kids.delete(kid)
      "#{kid.name} was tasty!"
    else
      "I don't have that kid"
    end
  end

end

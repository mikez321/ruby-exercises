class Ghostbuster
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def say_my_name
    puts "I'm #{name}"
  end

  def get_car(car = "ECTO-1")
    @car = car
  end


end

ghostbuster = Ghostbuster.new("Ray")
ghostbuster.say_my_name
puts ghostbuster.get_car

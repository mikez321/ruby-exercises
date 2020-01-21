class Hobbit
  attr_reader :name, :disposition, :age, :short
  def initialize(name, disposition = "homebody")
    @name = name
    @disposition = disposition
    @age = 0
    @adult = false
    @short = true
  end

  def celebrate_birthday
    @age += 1
  end

  def adult?
    return @adult = true if age > 32
  end

  def old?
    true if age > 100
  end

  def has_ring?
    true if name == "Frodo"
  end

  def is_short?
    short
  end

end

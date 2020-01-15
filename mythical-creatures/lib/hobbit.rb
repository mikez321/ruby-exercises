class Hobbit
  attr_reader :name, :disposition, :age, :adult, :short
  attr_writer :age, :adult
  def initialize(name, disposition = "homebody", age = 0, adult = false, short = true)
    @name = name
    @disposition = disposition
    @age = age
    @adult = false
    @short = true
  end

  def celebrate_birthday
    self.age += 1
  end

  def adult?
    if self.age < 33
      false
    else
      true
    end
  end

  def old?
    if self.age >= 101
      true
    else
      false
    end
  end

  def has_ring?
    if self.name == "Frodo"
      true
    else
      false
    end
  end

  def is_short?
    self.short
  end

end

class Alien
  attr_reader :name, :home, :color, :spaceship, :rapples, :plumbus
  def initialize(name, home = "Mars", color = "Green")
    @name = name
    @home = home
    @color = color
    @spaceship = false
    @rapples = 0
    @plumbus = false
  end

  def has_spaceship?
    spaceship
  end

  def speech
    @rapples += 1000
    "Jibba jabba jibba jabba"
  end

  def rapple_acct
    rapples
  end

  def buy_spaceship
    return "Insufficient Rapples" if rapple_acct < 1000
    @rapples -= 1000
    @spaceship = true
  end

  def pack_plumbus
    @plumbus = true
  end

  def ship_ready?
    spaceship && plumbus
  end

  def visit(planet)
    return "#{planet.name.capitalize} here I come!" if ship_ready?
    return "I forgot to bring a plumbus" if spaceship && !plumbus
    "I don't have a spaceship" if !spaceship
  end

end

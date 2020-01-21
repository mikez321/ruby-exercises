class Direwolf
  attr_reader :name, :home, :size
  def initialize(name, home="Beyond the Wall", size="Massive")
    @name = name
    @home = home
    @size = size
    @starks_to_protect = []
    @hunting = true
  end

  def starks_to_protect
    @starks_to_protect.take(2)
  end

  def protects(stark)
    if self.home == stark.location
      stark.safe = true
      @starks_to_protect << stark
    end
  end

  def hunts_white_walkers?
    if @starks_to_protect.count > 0
      @hunting = false
    else
      true
    end
  end

  def leaves(stark)
    stark.safe = false
    @starks_to_protect.pop

  end


end

class Stark
  attr_reader :name, :location
  attr_accessor :safe
  def initialize(name, location="Winterfell")
    @name = name
    @location = location
    @safe = false
  end

  def safe?
    safe
  end

  def house_words
    return "The North Remembers" if safe
    "Winter is Coming"
  end

end

class Pirate
  attr_reader :name, :job, :cursed, :number_heinous_acts, :booty
  attr_writer :cursed, :number_heinous_acts, :booty
  def initialize(name, job = "Scallywag", cursed = false, booty = 0)
    @name = name
    @job = job
    @cursed = cursed
    @number_heinous_acts = 0
    @booty = booty
  end

  def cursed?
    self.cursed
  end

  def commit_heinous_act
    self.number_heinous_acts += 1
    if self.number_heinous_acts >= 3
      @cursed = true
    end
  end

  def rob_ship
    self.booty += 100
  end

end

class Werewolf
  attr_reader :name, :location, :human, :wolf, :hungry, :belly
  attr_writer :location, :human, :wolf, :hungry, :belly
  def initialize(name, location="unknown", belly = [], human: true, wolf: false, hungry: false )
    @name = name
    @location = location
    @human = human
    @wolf = wolf
    @hungry = hungry
    @belly = belly
  end

  def human?
    self.human
  end

  def change!
    self.human = !self.human
    self.wolf = !self.wolf
  end

  def wolf?
    self.wolf
  end

  def hungry?
    # self.hungry = !self.human
    if self.human
      false
    elsif self.wolf
      if self.belly.count == 0
        true
      else
        false
      end
    end
  end

  def consume!(person)
    if self.human
      "People don't eat people"
    elsif self.wolf
      person.status = "dead"
      self.belly << person
    end

  end

end

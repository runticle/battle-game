class Player
  attr_reader :name, :health
  DEFAULT_HEALTH_POINTS = 50

  def initialize(name)
    @name = name
    @health = DEFAULT_HEALTH_POINTS
  end

  def receive_damage
    @health -= 10
  end
end

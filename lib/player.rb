class Player
  DEFAULT_HEALTH_POINTS = 50
  attr_reader :name, :health

  def initialize(name, hp = DEFAULT_HEALTH_POINTS)
    @name = name
    @health = hp
  end

  def receive_damage
    @health -= 10
  end
end

class Player
  attr_reader :name, :health

  def initialize(name)
    @name = name
    @health = 50
  end

  def attacked
    @health -= 10
  end
end

class Player
  DEFAULT_HEALTH_POINTS = 100
  attr_reader :name, :health, :health_status

  def initialize(name, hitpoints = DEFAULT_HEALTH_POINTS)
    @name = name
    @health = hitpoints
    @health_status = "strong"
  end

  def receive_damage
    @health -= 10
    health_calc
  end

  def health_calc
    case @health
    when 0..20
      @health_status = "veryweak"
    when 21..40
      @health_status = "weak"
    when 41..60
      @health_status = "okay"
    when 61..81
      @health_status = "good"
    else
      @health_status = "strong"
    end
  end

  def evaluate(number)
  case
  when number < 0
    puts "#{number} is negative"
  when (0..50) === number
    puts "#{number} is between 0 and 51"
  when (51..100) === number
    puts "#{number} is between 51 and 100"
  else
    puts "#{number} is greater than 100"
  end
end

  def dead
    @health <= 0
  end
end

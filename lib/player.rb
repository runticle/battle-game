class Player
  DEFAULT_HEALTH_POINTS = 100
  attr_reader :name, :health

  def initialize(name, hitpoints = DEFAULT_HEALTH_POINTS)
    @name = name
    @health = hitpoints
    @health_status = 'strong'
  end

  def receive_punch
    @health -= punch_damage
  end

  def receive_kick
    @health -= kick_damage
  end

  def heal
    @health += 25
  end

  def health_status
    health_calc
  end

  def dead
    @health <= 0
  end

  private

  def punch_damage
    Kernel.rand(20)
  end

  def kick_damage
    Kernel.rand(30)
  end

  def health_calc
    case @health
    when 0..20
      'veryweak'
    when 21..40
      'weak'
    when 41..60
      'okay'
    when 61..81
      'good'
    else
      'strong'
    end
  end
end

class Game
  attr_reader :receiver, :attacker

  def initialize(player1, player2)
    @players = [player1, player2]
    @attacker = player1
    @receiver = player2
    @message = "I hope you're ready for this..."
  end

  def self.create(player1, player2)
    @game = Game.new(player1, player2)
  end

  def self.instance
    @game
  end

  def player1
    @players.first
  end

  def player2
    @players.last
  end

  # messages

  attr_reader :message

  attr_reader :para

  # players moves

  def punch(player)
    player.receive_punch
    @message = punch_message
    switch_players unless player.paralysed?
  end

  def kick(player)
    player.receive_kick
    @message = kick_message
    switch_players
  end

  def heal(player)
    player.heal
    @message = heal_message
    switch_players
  end

  # game mechanics

  def switch_players
    @receiver = @receiver == player1 ? player2 : player1
    @attacker = @attacker == player1 ? player2 : player1
  end

  def game_over?
    player1.dead || player2.dead
  end

  def loser
    player1 if player1.dead
    player2 if player2.dead
  end

  def winner
    player1 == loser ? player2 : player1
  end

  private

  def punch_message
    "#{@attacker.name} punched #{@receiver.name}!"
  end

  def kick_message
    "#{@attacker.name} kicked #{@receiver.name}!"
  end

  def heal_message
    "#{@attacker.name} applied some bandages!"
  end
end

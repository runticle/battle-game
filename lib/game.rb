class Game
  attr_reader :next_receiver, :next_attacker

  def initialize(player1, player2)
    @players = [player1, player2]
    @next_receiver = player2
    @next_attacker = player1
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

  # players moves

  def punch(player)
    player.receive_punch
  end

  def kick(player)
    player.receive_kick
  end

  def heal(player)
    player.heal
  end

  # game mechanics

  def change_receiver
    @next_receiver = @next_receiver == player1 ? player2 : player1
  end

  def change_attacker
    @next_attacker = @next_attacker == player1 ? player2 : player1
  end

  def game_over?
    player1.dead || player2.dead
  end

  def loser
    @loser = player1 if player1.dead
    @loser = player2 if player2.dead
  end

  def winner
    player1 == loser ? player2 : player1
  end
end

class Game
  attr_reader :player1, :player2, :next_receiver

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @next_receiver = player2
  end

  def attack(player)
    player.receive_damage
  end

  def change_attacker
    @next_receiver == @player1 ? @next_receiver = @player2 : @next_receiver = @player1
  end

  def game_over?
    loser
  end

  def loser
    @loser = @player1 if @player1.health == 0
    @loser = @player2 if @player2.health == 0
  end
end

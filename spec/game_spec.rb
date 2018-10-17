require 'game'

describe Game do
  let(:player1) { double(:player1, receive_damage: true, health: 40) }
  let(:player2) { double(:player2, receive_damage: true, health: 40) }
  let(:game) { Game.new(player1, player2) }

  describe '#initialize' do
    it 'accepts two new players' do
      expect(game.player1).to eq player1
      expect(game.player2).to eq player2
    end
  end

  describe '#attack' do
    it 'damages player 1' do
      game.attack(player1)
      expect(player1.health).to eq 40
    end
    describe '#change_attacker'
    it 'player 2 is next receiver' do
      expect(game.next_receiver).to eq player2
    end
    it 'changes next_receiver to player 1' do
      game.change_attacker
      expect(game.next_receiver).to eq player1
    end
  end
end

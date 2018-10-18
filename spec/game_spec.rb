require 'game'

describe Game do
  let(:player1) { double(:player1) }
  let(:player2) { double(:player2) }
  let(:game) { described_class.new(player1, player2) }

  describe '#initialize' do
    it 'accepts two new players' do
      expect(game.player1).to eq player1
      expect(game.player2).to eq player2
    end
  end

  describe '#punch' do
    it 'damages player 1' do
      expect(player1).to receive(:receive_punch)
      game.punch(player1)
    end
    describe '#change_attacker'
    it 'player 2 is next receiver' do
      expect(game.next_receiver).to eq player2
    end
    it 'changes next_receiver to player 2' do
      game.change_receiver
      expect(game.next_receiver).to eq player1
    end
    it 'damages player 2' do
      expect(player2).to receive(:receive_punch)
      game.punch(player2)
    end
  end

  describe '#kick' do
    it 'damages player 1' do
      expect(player1).to receive(:receive_kick)
      game.kick(player1)
    end
  end

  describe '#heal' do
    it 'heals player 1' do
      expect(player1).to receive(:heal)
      game.heal(player1)
    end
  end
end

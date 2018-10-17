require 'game'

describe Game do
  let(:player1) { double(:player, receive_damage: true, health: 40) }
  let(:player2) { double(:player) }
  let(:game) { Game.new(player1, player2)}

  describe "#initialize" do
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
  end


end

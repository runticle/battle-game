require 'game'

describe Game do
  let(:player1) { double(:player, receive_damage: true, health: 40) }
  let(:game) { Game.new }

  describe '#attack' do
    it 'damages player 1' do
    game.attack(player1)
    expect(player1.health).to eq 40
    end
  end
end

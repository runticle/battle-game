require 'player'

describe Player do
  let(:player1) { Player.new('John') }
  it 'returns the name' do
    expect(player1.name).to eq 'John'
  end
  context 'health points' do
    it 'should start with 100HP' do
      expect(player1.health).to eq 100
    end
    it 'should take damage' do
      allow(player1).to receive(:punch_damage).and_return 15
      player1.receive_punch
      expect(player1.health).to eq 85
    end
  end
end

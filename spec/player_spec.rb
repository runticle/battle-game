require 'player'

describe Player do
  it 'returns the name' do
    player1 = Player.new("John")
    expect(player1.name).to eq "John"
  end
end

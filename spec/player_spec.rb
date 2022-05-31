# frozen_string_literal: true

require 'player'

describe Player do
  before do
    @player = Player.new('Test Player', 'X')
  end

  it 'returns the correct value for .name' do
    expect(@player.name).to eq('Test Player')
  end

  it 'returns the correct value for .mark' do
    expect(@player.marker).to eq('X')
  end
end

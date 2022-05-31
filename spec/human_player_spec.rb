# frozen_string_literal: true

require 'human_player'

describe HumanPlayer do
  before do
    @player = HumanPlayer.new('Player 1', 'X')
  end

  it 'returns the correct value for .name' do
    expect(@player.name).to eq('Player 1')
  end

  it 'returns the correct value for .mark' do
    expect(@player.marker).to eq('X')
  end

  describe '.select' do
    it 'takes in a player\'s input' do
      markers = %w[X O]
      expect($stdin).to receive(:gets).and_return('1')
      @player.select(markers)
    end
  end
end

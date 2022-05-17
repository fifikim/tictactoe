# frozen_string_literal: true

require 'players'
require 'player'

describe Players do
  before do
    @players = Players.new([Player.new('Player 1', 'X'), Player.new('Player 2', 'O')])
  end
  it 'shows the correct name for player 1' do
    expect(@players.player1.name).to eq('Player 1')
  end

  it 'shows the correct name for player 2' do
    expect(@players.player2.name).to eq('Player 2')
  end

  it 'shows the correct mark for player 1' do
    expect(@players.player1.mark).to eq('X')
  end

  it 'shows the correct mark for player 2' do
    expect(@players.player2.mark).to eq('O')
  end
end


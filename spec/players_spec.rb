# frozen_string_literal: true

require 'players'
require 'player'

describe Players do
  context 'when Player 1 is added first' do
    before do
      @players = Players.new([Player.new('Player 1', 'X'), Player.new('Player 2', 'O')])
    end

    it 'shows the correct name for player 1' do
      expect(@players.initial_order[0].name).to eq('Player 1')
    end

    it 'shows the correct name for player 2' do
      expect(@players.initial_order[1].name).to eq('Player 2')
    end

    it 'shows the correct mark for player 1' do
      expect(@players.initial_order[0].marker).to eq('X')
    end

    it 'shows the correct mark for player 2' do
      expect(@players.initial_order[1].marker).to eq('O')
    end
  end

  context 'when the order of players are reversed' do
    before do
      @players = Players.new([Player.new('Player 2', '0'), Player.new('Player 1', 'X')])
    end

    it 'shows the correct name for player 1' do
      expect(@players.initial_order[0].name).to eq('Player 2')
    end

    it 'shows the correct name for player 2' do
      expect(@players.initial_order[1].name).to eq('Player 1')
    end

    it 'shows the correct mark for player 1' do
      expect(@players.initial_order[0].marker).to eq('0')
    end

    it 'shows the correct mark for player 2' do
      expect(@players.initial_order[1].marker).to eq('X')
    end
  end
end

# frozen_string_literal: true

require 'win_finder'

describe WinFinder do
  let(:game_double) { Class.new { extend WinFinder } }

  context 'when board contains a winning combination' do
    it 'returns true' do
      board = %w[X X X O O X X O X]
      found = game_double.game_won?(board, 'X')
      expect(found).to be true
    end
  end

  context 'when board does not contain a winning combination' do
    it 'returns false' do
      board = %w[X X O O O X X O X]
      found = game_double.game_won?(board, 'X')
      expect(found).to be false
    end
  end
end

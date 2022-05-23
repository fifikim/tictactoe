# frozen_string_literal: true

require 'win_finder'

describe WinFinder do
  let(:game_double) { Class.new { extend WinFinder } }

  context 'when board contains a winning combination' do
    it 'returns true for a win at indices 0, 1, 2' do
      board = %w[X X X 4 5 6 7 8 9]
      found = game_double.game_won?(board, 'X')
      expect(found).to be true
    end

    it 'returns true for a win at indices 3, 4, 5' do
      board = %w[1 2 3 X X X 7 8 9]
      found = game_double.game_won?(board, 'X')
      expect(found).to be true
    end

    it 'returns true for a win at indices 6, 7, 8' do
      board = %w[1 2 3 4 5 6 X X X]
      found = game_double.game_won?(board, 'X')
      expect(found).to be true
    end

    it 'returns true for a win at indices 0, 3, 6' do
      board = %w[X 2 3 X 5 6 X 8 9]
      found = game_double.game_won?(board, 'X')
      expect(found).to be true
    end

    it 'returns true for a win at indices 1, 4, 7' do
      board = %w[1 X 3 4 X 6 7 X 9]
      found = game_double.game_won?(board, 'X')
      expect(found).to be true
    end

    it 'returns true for a win at indices 2, 5, 8' do
      board = %w[1 2 X 4 5 X 7 8 X]
      found = game_double.game_won?(board, 'X')
      expect(found).to be true
    end

    it 'returns true for a win at indices 0, 4, 8' do
      board = %w[X 2 3 4 X 6 7 8 X]
      found = game_double.game_won?(board, 'X')
      expect(found).to be true
    end

    it 'returns true for a win at indices 2, 4, 6' do
      board = %w[1 2 X 4 X 6 X 8 9]
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

# frozen_string_literal: true

require 'win_finder'

describe WinFinder do
  context 'when checking a 3x3 board' do
    {
      '0, 1, 2': %w[X X X 4 5 6 7 8 9],
      '3, 4, 5': %w[1 2 3 X X X 7 8 9],
      '6, 7, 8': %w[1 2 3 4 5 6 X X X],
      '0, 3, 6': %w[X 2 3 X 5 6 X 8 9],
      '1, 4, 7': %w[1 X 3 4 X 6 7 X 9],
      '2, 5, 8': %w[1 2 X 4 5 X 7 8 X],
      '0, 4, 8': %w[X 2 3 4 X 6 7 8 X],
      '2, 4, 6': %w[1 2 X 4 X 6 X 8 9]
    }.each do |indices, array|
      it "returns true for a winning combination at indices #{indices}" do
        finder = WinFinder.new(9)
        found = finder.game_won?(array, 'X')
        expect(found).to be true
      end
    end

    it 'returns false when the board does not contain a winning combination' do
      array = %w[1 2 3 4 5 6 7 8 9]
      finder = WinFinder.new(9)
      found = finder.game_won?(array, 'X')
      expect(found).to be false
    end
  end

  context 'when checking a 4x4 board' do
    {
      '0, 1, 2, 3': %w[X X X X 5 6 7 8 9 10 11 12 13 14 15 16],
      '4, 5, 6, 7': %w[1 2 3 4 X X X X 9 10 11 12 13 14 15 16],
      '8, 9, 10, 11': %w[1 2 3 4 5 6 7 8 X X X X 13 14 15 16],
      '12, 13, 14, 15': %w[1 2 3 4 5 6 7 8 9 10 11 12 X X X X],
      '0, 4, 8, 12': %w[X 2 3 4 X 6 7 8 X 10 11 12 X 14 15 16],
      '1, 5, 9, 13': %w[1 X 3 4 5 X 7 8 9 X 11 12 13 X 15 16],
      '2, 6, 10, 14': %w[1 2 X 4 5 6 X 8 9 10 X 12 13 14 X 16],
      '3, 7, 11, 15': %w[1 2 3 X 5 6 7 X 9 10 11 X 13 14 15 X],
      '0, 5, 10, 15': %w[X 2 3 4 5 X 7 8 9 10 X 12 13 14 15 X],
      '3, 6, 9, 12': %w[1 2 3 X 5 6 X 8 9 X 11 12 X 14 15 16]
    }.each do |indices, array|
      it "returns true for a winning combination at indices #{indices}" do
        finder = WinFinder.new(16)
        found = finder.game_won?(array, 'X')
        expect(found).to be true
      end
    end

    it 'returns false when the board does not contain a winning combination' do
      array = %w[X X O O O X X O X 10 11 12 13 14 15 16]
      finder = WinFinder.new(16)
      found = finder.game_won?(array, 'X')
      expect(found).to be false
    end
  end

  context 'when checking a 5x5 board' do
    {
      '0, 1, 2, 3, 4': %w[X X X X X 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25],
      '5, 6, 7, 8, 9': %w[1 2 3 4 5 X X X X X 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25],
      '10, 11, 12, 13, 14': %w[1 2 3 4 5 6 7 8 9 10 X X X X X 16 17 18 19 20 21 22 23 24 25],
      '15, 16, 17, 18, 19': %w[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 X X X X X 21 22 23 24 25],
      '20, 21, 22, 23, 24': %w[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 X X X X X],
      '0, 5, 10, 15, 20': %w[X 2 3 4 5 X 7 8 9 10 X 12 13 14 15 X 17 18 19 20 X 22 23 24 25],
      '1, 6, 11, 16, 21': %w[1 X 3 4 5 6 X 8 9 10 11 X 13 14 15 16 X 18 19 20 21 X 23 24 25],
      '2, 7, 12, 17, 22': %w[1 2 X 4 5 6 7 X 9 10 11 12 X 14 15 16 17 X 19 20 21 22 X 24 25],
      '3, 8, 13, 18, 23': %w[1 2 3 X 5 6 7 8 X 10 11 12 13 X 15 16 17 18 X 20 21 22 23 X 25],
      '4, 9, 14, 19, 24': %w[1 2 3 4 X 6 7 8 9 X 11 12 13 14 X 16 17 18 19 X 21 22 23 24 X],
      '0, 6, 12, 18, 24': %w[X 2 3 4 5 6 X 8 9 10 11 12 X 14 15 16 17 18 X 20 21 22 23 24 X],
      '4, 8, 12, 16, 20': %w[1 2 3 4 X 6 7 8 X 10 11 12 X 14 15 16 X 18 19 20 X 22 23 24 25]
    }.each do |indices, array|
      it "returns true for a winning combination at indices #{indices}" do
        finder = WinFinder.new(25)
        found = finder.game_won?(array, 'X')
        expect(found).to be true
      end
    end

    it 'returns false when the board does not contain a winning combination' do
      array = %w[X X O O O X X O X 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25]
      finder = WinFinder.new(25)
      found = finder.game_won?(array, 'X')
      expect(found).to be false
    end
  end
end

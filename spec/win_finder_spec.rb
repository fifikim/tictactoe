# frozen_string_literal: true

require 'win_finder'
require 'board_mocker'

describe WinFinder do
  context 'when checking a 3x3 board' do
    [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7]
    ].each do |spaces|
      it "returns true for a winning combination at spaces #{spaces}" do
        mock_board = BoardMocker.fill(9, { X: spaces })
        finder = WinFinder.new(9)
        won = finder.game_won?(mock_board, 'X')
        expect(won).to be true
      end
    end

    it 'returns false when the board does not contain a winning combination' do
      mock_board = BoardMocker.fill(9)
      finder = WinFinder.new(9)
      won = finder.game_won?(mock_board, 'X')
      expect(won).to be false
    end
  end

  context 'when checking a 4x4 board' do
    [
      [1, 2, 3, 4],
      [5, 6, 7, 8],
      [9, 10, 11, 12],
      [13, 14, 15, 16],
      [1, 5, 9, 13],
      [2, 6, 10, 14],
      [3, 7, 11, 15],
      [4, 8, 12, 16],
      [1, 6, 11, 16],
      [4, 7, 10, 13]
    ].each do |spaces|
      it "returns true for a winning combination at spaces #{spaces}" do
        mock_board = BoardMocker.fill(16, { X: spaces })
        finder = WinFinder.new(16)
        won = finder.game_won?(mock_board, 'X')
        expect(won).to be true
      end
    end

    it 'returns false when the board does not contain a winning combination' do
      mock_board = BoardMocker.fill(16)
      finder = WinFinder.new(16)
      won = finder.game_won?(mock_board, 'X')
      expect(won).to be false
    end
  end

  context 'when checking a 5x5 board' do
    [
      [1, 2, 3, 4, 5],
      [6, 7, 8, 9, 10],
      [11, 12, 13, 14, 15],
      [16, 17, 18, 19, 20],
      [21, 22, 23, 24, 25],
      [1, 6, 11, 16, 21],
      [2, 7, 12, 17, 22],
      [3, 8, 13, 18, 23],
      [4, 9, 14, 19, 24],
      [5, 10, 15, 20, 25],
      [1, 7, 13, 19, 25],
      [5, 9, 13, 17, 21]
    ].each do |spaces|
      it "returns true for a winning combination at spaces #{spaces}" do
        mock_board = BoardMocker.fill(25, { X: spaces })
        finder = WinFinder.new(25)
        found = finder.game_won?(mock_board, 'X')
        expect(found).to be true
      end
    end

    it 'returns false when the board does not contain a winning combination' do
      mock_board = BoardMocker.fill(25)
      finder = WinFinder.new(25)
      found = finder.game_won?(mock_board, 'X')
      expect(found).to be false
    end
  end
end

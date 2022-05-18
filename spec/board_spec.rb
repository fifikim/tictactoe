# frozen_string_literal: true

require 'board'

describe Board do
  context 'when starting a new game' do
    let(:board) { Board.new }

    it 'elements in the spaces array contain an integer from 1 to 9' do
      expect(board.spaces).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  context 'when recording player turns' do
    board = Board.new

    it 'records an "X" for player 1 in the spaces array at the correct index' do
      chosen_index = 0
      board.record_move('X', chosen_index)
      expect(board.spaces).to eq(['X', 2, 3, 4, 5, 6, 7, 8, 9])
    end

    it 'records an "O" for player 2 in the spaces array at the correct index' do
      chosen_index = 1
      board.record_move('O', chosen_index)
      expect(board.spaces).to eq(['X', 'O', 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe '.won?' do
    it 'returns true when the board contains player 1\'s marker on cells 1, 2, and 3' do
      board = Board.new(['X', 'X', 'X', 4, 5, 6, 7, 8, 9])
      expect(board.won?('X')).to be true
    end

    it 'returns true when the board contains player 2\'s marker on cells 1, 2, and 3' do
      board = Board.new(['O', 'O', 'O', 4, 5, 6, 7, 8, 9])
      expect(board.won?('O')).to be true
    end

    it 'returns true when the board contains player 1\'s marker on cells 4, 5, and 6' do
      board = Board.new(['O', 'O', 3, 'X', 'X', 'X', 7, 8, 9])
      expect(board.won?('X')).to be true
    end

    it 'returns true when the board contains player 2\'s marker on cells 4, 5, and 6' do
      board = Board.new(['O', 'O', 3, 'O', 'O', 'O', 7, 8, 9])
      expect(board.won?('O')).to be true
    end

    it 'returns false when the board does not contain a winning combination' do
      board = Board.new(['X', 'X', 3, 'X', 5, 6, 7, 8, 9])
      expect(board.won?('X')).to be false
    end

    it 'returns false when contains a winning combination for the other player' do
      board = Board.new(['X', 'X', 'X', 4, 5, 6, 7, 8, 9])
      expect(board.won?('O')).to be false
    end
  end

  describe '.full?' do
    it 'returns true when the board is full' do
      board = Board.new(%w[X X X X X X X X X])
      expect(board.full?).to be true
    end

    it 'returns false when the board is not full' do
      board = Board.new(['X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 9])
      expect(board.full?).to be false
    end
  end
end

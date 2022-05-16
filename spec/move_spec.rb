# frozen_string_literal: true

require 'move'

describe Move do
  it 'creates a new object' do
    input = '1'
    board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    Move.new(1, input, board)
  end

  describe '.valid?' do
    it 'returns true if move is a valid character and space is free' do
      input = '1'
      board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
      selection = Move.new(1, input, board)
      expect(selection.valid?).to be true
    end

    it 'returns false if move is a valid character and space is not free' do
      input = '1'
      board = Board.new(['X', 2, 3, 4, 5, 6, 7, 8, 9])
      selection = Move.new(1, input, board)
      expect(selection.valid?).to be false
    end

    it 'returns false if move is an invalid character' do
      input = 'n'
      board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
      selection = Move.new(1, input, board)
      expect(selection.valid?).to be false
    end
  end
end

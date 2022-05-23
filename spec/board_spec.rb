# frozen_string_literal: true

require 'board'

describe Board do
  context 'when starting a new game' do
    it 'elements in the spaces array contain an integer from 1 to 9' do
      board = Board.new(%w[X O])
      expect(board.spaces).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  context 'when recording player turns' do
    board = Board.new(%w[X O])

    it 'records an "X" for player 1 in the spaces array at the correct index' do
      chosen_space = 1
      board.record_move('X', chosen_space)
      expect(board.spaces).to eq(['X', 2, 3, 4, 5, 6, 7, 8, 9])
    end

    it 'records an "O" for player 2 in the spaces array at the correct index' do
      chosen_space = 2
      board.record_move('O', chosen_space)
      expect(board.spaces).to eq(['X', 'O', 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe '.full?' do
    it 'returns true if there are no more free spaces on the board' do
      board = Board.new(%w[X O], %w[X X O O O X X O X])
      full_board = board.full?
      expect(full_board).to be true
    end

    it 'returns false if there are free spaces on the board' do
      board = Board.new(%w[X O], ['X', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 9])
      full_board = board.full?
      expect(full_board).to be false
    end
  end

  describe '.occupied_space?' do
    board = Board.new(%w[X O], ['X', 2, 3, 4, 5, 6, 7, 8, 9])

    it 'returns true if a space has already been marked' do
      space_occupied = board.occupied_space?('1')
      expect(space_occupied).to be true
    end

    it 'returns false if a space is free' do
      space_occupied = board.occupied_space?('2')
      expect(space_occupied).to be false
    end
  end

  describe '.first_free' do
    it "returns '1' if the board is empty" do
      board = Board.new(%w[X O], [1, 2, 3, 4, 5, 6, 7, 8, 9])
      first_free = board.first_free
      expect(first_free).to eq('1')
    end

    it "returns '2' if the first space is occupied" do
      board = Board.new(%w[X O], ['X', 2, 3, 4, 5, 6, 7, 8, 9])
      first_free = board.first_free
      expect(first_free).to eq('2')
    end

    it "returns '3' if the first two spaces are occupied" do
      board = Board.new(%w[X O], ['X', 'O', 3, 4, 5, 6, 7, 8, 9])
      first_free = board.first_free
      expect(first_free).to eq('3')
    end

    it "returns '1' if the first space is free and other spaces are occupied" do
      board = Board.new(%w[X O], [1, 'O', 'X', 4, 5, 6, 7, 8, 9])
      first_free = board.first_free
      expect(first_free).to eq('1')
    end
  end
end

# frozen_string_literal: true

require 'board'
require 'board_mocker'

describe Board do
  context 'when starting a new game' do
    it 'elements in the spaces array contain an integer from 1 to 9' do
      board = Board.new
      expect(board.spaces).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  context 'when recording player turns' do
    board = Board.new

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
      spaces = BoardMocker.fill(9, { X: [1, 2, 6, 7, 9], O: [3, 4, 5, 8] })
      board = Board.new(spaces)

      full_board = board.full?(%w[X O])
      expect(full_board).to be true
    end

    it 'returns false if there are free spaces on the board' do
      spaces = BoardMocker.fill(9, { X: [1, 2, 6, 7], O: [3, 4, 5, 8] })
      board = Board.new(spaces)

      full_board = board.full?(%w[X O])
      expect(full_board).to be false
    end
  end

  describe '.occupied_space?' do
    board = Board.new(['X', 2, 3, 4, 5, 6, 7, 8, 9])

    it 'returns true if a space has already been marked' do
      space_occupied = board.occupied_space?('1', %w[X O])
      expect(space_occupied).to be true
    end

    it 'returns false if a space is free' do
      space_occupied = board.occupied_space?('2', %w[X O])
      expect(space_occupied).to be false
    end
  end

  describe '.first_free' do
    {
      'board is empty' => ['1', [1, 2, 3, 4, 5, 6, 7, 8, 9]],
      'first space is occupied' => ['2', ['X', 2, 3, 4, 5, 6, 7, 8, 9]],
      'first two spaces are occupied' => ['3', ['X', 'O', 3, 4, 5, 6, 7, 8, 9]],
      'the first space is free and other spaces are occupied' => ['1', [1, 'O', 'X', 4, 5, 6, 7, 8, 9]]
    }.each do |condition, options|
      it "returns #{options[0]} if #{condition}" do
        board = Board.new(options[1])
        first_free = board.first_free(%w[X O])
        expect(first_free).to eq(options[0])
      end
    end
  end
end

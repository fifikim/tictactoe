# frozen_string_literal: true

require 'board'

describe 'Board' do
  context 'when starting a new game' do
    let(:board) { Board.new }

    it 'elements in the spaces array contain an integer from 1 to 9' do
      expect(board.spaces).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    describe '.draw' do
      it 'draws a numbered board without any markers' do
        board = Board.new
        expect(board.draw).to eq(" 1 | 2 | 3\n---|---|---\n 4 | 5 | 6\n---|---|---\n 7 | 8 | 9\n")
      end
    end
  end

  context 'when recording player turns' do
    board = Board.new

    it 'records an "X" for player 1 in the spaces array at the correct index' do
      chosen_space = 1
      board.record_move(1, chosen_space)
      expect(board.spaces).to eq(["X", 2, 3, 4, 5, 6, 7, 8, 9])
    end

    it 'records an "O" for player 2 in the spaces array at the correct index' do
      chosen_space = 2
      board.record_move(2, chosen_space)
      expect(board.spaces).to eq(["X", "O", 3, 4, 5, 6, 7, 8, 9])
    end

    describe '.draw' do
      it 'redraws the board with the correct markers in the correct spaces' do
        expect(board.draw).to eq(" X | O | 3\n---|---|---\n 4 | 5 | 6\n---|---|---\n 7 | 8 | 9\n")
      end
    end
 
  end 
end

# frozen_string_literal: true

require 'board'

describe 'Board' do
  context 'when starting a new game' do
    let(:board) { Board.new }

    it 'all spaces contain their number' do
      expect(board.spaces).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    describe '.draw' do
      it 'draws a numbered board without any markers' do
        board = Board.new
        expect(board.draw).to eq(" 1 | 2 | 3\n---|---|---\n 4 | 5 | 6\n---|---|---\n 7 | 8 | 9\n")
      end
    end
  end
end

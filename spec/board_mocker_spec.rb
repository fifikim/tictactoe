# frozen_string_literal: true

require 'board_mocker'

describe BoardMocker do
  describe '.fill' do
    context 'when passed only a board size' do
      it 'returns a numbered array' do
        board_size = 9
        mock = BoardMocker.fill(board_size)

        expect(mock).to eq((1..9).to_a)
      end
    end

    context 'when passed a board size and a hash with a single marker' do
      it 'records a single marker at the correct space' do
        board_size = 9
        moves = { X: [1] }
        mock = BoardMocker.fill(board_size, moves)

        expect(mock).to eq(['X', 2, 3, 4, 5, 6, 7, 8, 9])
      end

      it 'records multiple markers at their correct spaces' do
        board_size = 9
        moves = { X: [1, 2, 3] }
        mock = BoardMocker.fill(board_size, moves)

        expect(mock).to eq(['X', 'X', 'X', 4, 5, 6, 7, 8, 9])
      end
    end

    context 'when passed a board size and a hash with multiple markers' do
      it 'records a single marker at the correct space for each marker' do
        board_size = 9
        moves = { X: [1], O: [3] }
        mock = BoardMocker.fill(board_size, moves)

        expect(mock).to eq(['X', 2, 'O', 4, 5, 6, 7, 8, 9])
      end

      it 'records multiple markers at their correct spaces for each marker' do
        board_size = 9
        moves = { X: [1, 2, 3], O: [4, 5, 6] }
        mock = BoardMocker.fill(board_size, moves)

        expect(mock).to eq(['X', 'X', 'X', 'O', 'O', 'O', 7, 8, 9])
      end
    end
  end
end

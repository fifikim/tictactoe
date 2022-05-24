# frozen_string_literal: true

require 'win_finder'

describe WinFinder do
  let(:game_double) { Class.new { extend WinFinder } }

  context 'when board contains a winning combination' do
    {
      '0, 1, 2':  %w[X X X 4 5 6 7 8 9],
      '3, 4, 5':  %w[1 2 3 X X X 7 8 9],
      '6, 7, 8':  %w[1 2 3 4 5 6 X X X],
      '0, 3, 6':  %w[X 2 3 X 5 6 X 8 9],
      '1, 4, 7':  %w[1 X 3 4 X 6 7 X 9],
      '2, 5, 8':  %w[1 2 X 4 5 X 7 8 X],
      '0, 4, 8':  %w[X 2 3 4 X 6 7 8 X],
      '2, 4, 6':  %w[1 2 X 4 X 6 X 8 9],
    }.each do |indices, array|
      it "returns true for a win at indices #{indices}" do
        found = game_double.game_won?(array, 'X')
        expect(found).to be true
      end
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

# frozen_string_literal: true

require 'game'

describe 'Game' do
  context 'when starting a new game' do
    let(:game) { Game.new }

    it 'initializes a game with an empty (numbered) board' do
      expect(game.board.spaces).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    describe '.play' do
      it 'displays a fully numbered game board' do
        expect do
          game.play
        end.to output(" 1 | 2 | 3\n---|---|---\n 4 | 5 | 6\n---|---|---\n 7 | 8 | 9\n").to_stdout
      end
    end
  end
end

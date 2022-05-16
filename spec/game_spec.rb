# frozen_string_literal: true

require 'game'

describe Game do
  context 'when starting a new game' do
    let(:game) { Game.new }

    it 'initializes a game with an empty (numbered) board' do
      expect(game.board.spaces).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    describe '.play' do
      it 'displays a fully numbered game board and indicates player 1 turn' do
        expect do
          game.play
        end.to output(" 1 | 2 | 3\n---|---|---\n 4 | 5 | 6\n---|---|---\n 7 | 8 | 9\n\nPlayer 1's move:\n").to_stdout
      end

      context 'when a player takes a turn' do
        it 'redraws the board with the previous player\'s marker in the correct space' do
        end

        it 'switches the player at the end of the turn' do
          first_player = game.current_player
          game.play # TODO: stub this out?
          next_player = game.current_player
          expect(first_player).to_not eq(next_player)
        end
      end
    end
  end
end

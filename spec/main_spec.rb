# frozen_string_literal: true

require 'main'

describe 'Main' do
  context 'when starting a new game' do
    let(:main) { Main.new }

    # rubocop:disable Layout/LineLength
    it 'prints instructions and a numbered board to the console' do
      expect do
        main.run
      end.to output("TIC TAC TOE\n\nInstructions:\nEnter the number (1-9) of the space on the board where you want to move.\nPlayer 1 moves first and marks their spaces with an \"X\". Player 2 marks with an \"O\".\nTo win, claim 3 adjacent spaces in a horizontal, vertical, or diagonal line.\nIf there are no free spaces and no player has won, the game will end in a draw.\n\nStarting new game...\n\n 1 | 2 | 3\n---|---|---\n 4 | 5 | 6\n---|---|---\n 7 | 8 | 9\n").to_stdout
    end
    # rubocop:enable Layout/LineLength
  end
end

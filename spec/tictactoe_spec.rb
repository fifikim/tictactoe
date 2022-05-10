# frozen_string_literal: true

require 'tictactoe'

describe 'Tic Tac Toe' do
  context 'when starting a new game' do
    before do
      @tictactoe = TicTacToe.new
    end

    # rubocop:disable Layout/LineLength
    it 'displays instructions' do
      expect do
        @tictactoe.display_instructions
      end.to output("TIC TAC TOE\n\nInstructions:\nPlayer 1 moves first and marks spaces with an \"X\". Player 2 marks with an \"O\".\n\nEnter the number (1-9) corresponding to the space that you want to mark.\n\nTo win, mark off 3 adjacent spaces (horizontal, vertical, or diagonal) with your marker.\n\nIf there are no available spaces and no player has won, the game will end in a draw.\n\nStarting new game...\n").to_stdout
    end
    # rubocop:enable Layout/LineLength

    it 'displays a numbered board' do
      expect do
        @tictactoe.display_board
      end.to output("\n\n 1 | 2 | 3 \n---|---|---\n 4 | 5 | 6 \n---|---|---\n 7 | 8 | 9 \n").to_stdout
    end
  end
end

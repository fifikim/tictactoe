# frozen_string_literal: true

# Contains gameplay methods
class TicTacToe
  def display_instructions
    # rubocop:disable Layout/LineLength
    puts "TIC TAC TOE\n\nInstructions:\nPlayer 1 moves first and marks spaces with an \"X\". Player 2 marks with an \"O\".\n\nEnter the number (1-9) corresponding to the space that you want to mark.\n\nTo win, mark off 3 adjacent spaces (horizontal, vertical, or diagonal) with your marker.\n\nIf there are no available spaces and no player has won, the game will end in a draw.\n\nStarting new game...\n"
    # rubocop:enable Layout/LineLength
  end

  def display_board
    puts "\n\n 1 | 2 | 3 \n---|---|---\n 4 | 5 | 6 \n---|---|---\n 7 | 8 | 9 \n"
  end
end

game = TicTacToe.new
game.display_instructions
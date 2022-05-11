# frozen_string_literal: true

# Contains gameplay methods
class TicTacToe
  def display_instructions
    puts "TIC TAC TOE\n\n"
    puts 'Instructions:'
    puts "Enter the number (1-9) of the space on the board where you want to move.\n\n"
    puts "Player 1 moves first and marks their spaces with an \"X\". Player 2 marks with an \"O\".\n\n"
    puts "To win, claim 3 adjacent spaces in a horizontal, vertical, or diagonal line.\n\n"
    puts "If there are no free spaces and no player has won, the game will end in a draw.\n\n"
    puts "Starting new game...\n"
  end

  def display_board
    puts "\n\n 1 | 2 | 3 "
    puts "---|---|---"
    puts " 4 | 5 | 6 "
    puts "---|---|---"
    puts " 7 | 8 | 9 "
  end
end

game = TicTacToe.new
game.display_instructions
game.display_board

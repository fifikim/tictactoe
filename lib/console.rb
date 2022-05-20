# frozen_string_literal: true

class Console
  def output(message)
    puts message
  end

  def menu
    output(game_types)
  end

  def instructions
    output(instruction)
  end

  def board(board)
    current_board = board_template(board.spaces)
    output(current_board)
  end

  private

  def instruction
    "TIC TAC TOE\n\n" \
      "Instructions:\n" \
      "Enter the number (1-9) of the space on the board where you want to move.\n" \
      "Player 1 moves first and marks their spaces with an \"X\". Player 2 marks with an \"O\".\n" \
      "To win, claim 3 adjacent spaces in a horizontal, vertical, or diagonal line.\n" \
      "If there are no free spaces and no player has won, the game will end in a draw.\n\n" \
  end

  def game_types
    "Who would you like to play against?\n" \
      "Select a number:\n" \
      "1 - Player vs. Player\n" \
      "2 - Computer vs. Player\n"
  end

  def board_template(board)
    "\n #{board[0]} | #{board[1]} | #{board[2]}\n" \
      "---|---|---\n" \
      " #{board[3]} | #{board[4]} | #{board[5]}\n" \
      "---|---|---\n" \
      " #{board[6]} | #{board[7]} | #{board[8]}\n\n"
  end
end

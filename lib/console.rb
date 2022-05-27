# frozen_string_literal: true

class Console
  def output(message)
    puts message
  end

  def instructions
    output(instruction)
  end

  def menu_error
    output('Invalid selection! Please choose from the numbers listed above.')
  end

  def board(board)
    current_board = board_template(board.spaces)
    output(current_board)
  end

  def player_menu
    output(player_types)
  end

  def order_menu(unordered_players)
    menu = order_types(unordered_players)
    output(menu)
  end

  def board_menu
    output(board_types)
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

  def board_template(board)
    "\n #{board[0]} | #{board[1]} | #{board[2]}\n" \
      "---|---|---\n" \
      " #{board[3]} | #{board[4]} | #{board[5]}\n" \
      "---|---|---\n" \
      " #{board[6]} | #{board[7]} | #{board[8]}\n\n"
  end

  def player_types
    "\nWho would you like to play against?\n" \
      "1 - Another player\n" \
      "2 - Computer\n"
  end

  def order_types(unordered_players)
    "\nWho should take the first turn?\n" \
      "1 - #{unordered_players[0].name}\n" \
      "2 - #{unordered_players[1].name}\n"
  end

  def board_types
    ## can this populate based on BOARD_OPTIONS
    "\nWhat size board would you like?\n" \
    "1 - 3x3\n" \
    "2 - 4x4\n" \
    "3 - 5x5\n"
  end
end

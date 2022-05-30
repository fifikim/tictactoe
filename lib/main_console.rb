require_relative 'console'

class MainConsole < Console
  def initialize
  end

  def welcome
    output(welcome_msg)
  end

  def menu_error
    output('Invalid selection! Please choose from the numbers listed above.')
  end

  def player_menu
    output(player_types)
  end

  def order_menu(unordered_players)
    menu = order_types(unordered_players)
    output(menu)
  end

  # pass in board options
  def board_menu
    output(board_types)
  end

  private

  def welcome_msg
    "Welcome to TIC TAC TOE\n\n" \
      "Select game options:\n\n"
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

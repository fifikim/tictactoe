# frozen_string_literal: true

require_relative 'console'
require_relative 'board_selector'
require_relative 'player_selector'

class MainConsole < Console
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

  def board_menu
    output(board_types)
  end

  private

  def welcome_msg
    "Welcome to TIC TAC TOE\n\n" \
      "Select game options:\n\n"
  end

  def list_options(option_type)
    option_type.map.with_index do |(key, _value), index|
      "#{index + 1} - #{key}\n"
    end.join
  end

  def player_types
    "\nWho would you like to play against?\n" \
      "#{list_options($PLAYER_OPTIONS)}"
  end

  def board_types
    "\nWhat size board would you like?\n" \
      "#{list_options($BOARD_OPTIONS)}"
  end

  def order_types(unordered_players)
    "\nWho should take the first turn?\n" \
      "1 - #{unordered_players[0].name}\n" \
      "2 - #{unordered_players[1].name}\n"
  end
end

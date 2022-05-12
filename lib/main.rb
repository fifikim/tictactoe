# frozen_string_literal: true

require_relative 'game'

class Main
  def run
    display_instructions
    start_game
  end

  private

  def start_game
    @game = Game.new
    @game.play
  end

  def display_instructions
    puts "TIC TAC TOE\n\n"
    puts 'Instructions:'
    puts 'Enter the number (1-9) of the space on the board where you want to move.'
    puts 'Player 1 moves first and marks their spaces with an "X". Player 2 marks with an "O".'
    puts 'To win, claim 3 adjacent spaces in a horizontal, vertical, or diagonal line.'
    puts "If there are no free spaces and no player has won, the game will end in a draw.\n\n"
    puts "Starting new game...\n\n"
  end
end

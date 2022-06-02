# frozen_string_literal: true

require_relative 'console'

class GameConsole < Console
  def initialize(board_size)
    super
    @board_size = board_size
    @line_length = Math.sqrt(board_size).to_i
  end

  def instructions
    output(instruction)
  end

  def invalid_message
    output("Invalid character! Please select an integer from 1-#{@board_size}:")
  end

  def board(current_board)
    board_output = fill_template(current_board.spaces)
    output(board_output)
  end

  private

  def instruction
    "Instructions:\n" \
      "Enter the number (1-#{@board_size}) of the space on the board where you want to move.\n" \
      "Player 1 moves first and marks their spaces with an \"X\". Player 2 marks with an \"O\".\n" \
      "To win, claim 3 adjacent spaces in a horizontal, vertical, or diagonal line.\n" \
      "If there are no free spaces and no player has won, the game will end in a draw.\n\n" \
  end

  def fill_template(array)
    rows = split_rows(array)
    format_board(rows)
  end

  def format_board(rows)
    board = rows.map { |row| format_row(row) }.join(horizontal_line)
    "\n#{board}\n"
  end

  def format_row(row)
    formatted_row = row.map { |space| format_space(space) }.join('|')
    "#{formatted_row}\n"
  end

  def format_space(space)
    " #{space.to_s.rjust(2)} "
  end

  def split_rows(array)
    array.each_slice(@line_length).to_a
  end

  def horizontal_line
    spacer_line = []
    @line_length.times { spacer_line << '----' }
    spacer_line.join('|').concat("\n")
  end
end
